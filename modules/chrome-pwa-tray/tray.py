#!/usr/bin/env python3
import re
import signal
from contextlib import closing
from pathlib import Path
from tempfile import TemporaryDirectory

import gi
from Xlib import Xatom, display, error

gi.require_version("Gdk", "3.0")
gi.require_version("GdkX11", "3.0")
gi.require_version("GLibUnix", "2.0")
gi.require_version("Gtk", "3.0")
gi.require_version("Wnck", "3.0")
gi.require_version("XApp", "1.0")
from gi.repository import Gdk, GdkX11, Gio, GLib, GLibUnix, Gtk, Wnck, XApp


CHROME_APP_INSTANCE = re.compile(r"crx_[a-p]{32}")


class ChromeAppTray:
    def __init__(self, screen, x_display, icon_dir):
        self.screen = screen
        self.x_display = x_display
        self.skip_marker = x_display.intern_atom("_CHROME_PWA_TRAY_SKIP_TASKBAR")
        self.icon_dir = icon_dir
        self.icons = {}
        self.marked_windows = set()
        self.settings = Gio.Settings.new("org.cinnamon")
        self.settings.connect("changed::enabled-applets", self.panel_applets_changed)
        screen.connect("window-opened", self.watch_window)
        screen.connect("window-closed", self.window_closed)
        for window in screen.get_windows():
            self.watch_window(screen, window)

    def watch_window(self, _screen, window):
        # The marker lives on the X11 window and survives a helper crash.
        try:
            if self.x_window(window).get_full_property(self.skip_marker, Xatom.CARDINAL):
                self.marked_windows.add(window)
        except error.BadWindow:
            return

        window.connect("state-changed", self.state_changed)
        window.connect("class-changed", self.update_window)
        window.connect("type-changed", self.update_window)
        window.connect("name-changed", self.update_title)
        self.update_window(window)

    def state_changed(self, window, changed, _state):
        if changed & Wnck.WindowState.MINIMIZED:
            self.update_window(window)

    def update_window(self, window):
        app_instance = window.get_class_instance_name() or ""
        if not (
            window.is_minimized()
            and window.get_window_type() == Wnck.WindowType.NORMAL
            and CHROME_APP_INSTANCE.fullmatch(app_instance)
        ):
            self.remove_icon(window)
            return

        if window in self.icons:
            return
        if window.is_skip_tasklist() and window not in self.marked_windows:
            return

        icon_path = self.icon_path(window)
        window.get_icon().savev(str(icon_path), "png", [], [])
        icon = XApp.StatusIcon.new_with_name("chrome-pwa-tray")
        icon.set_visible(False)
        icon.set_icon_name(str(icon_path))
        self.icons[window] = icon
        icon.connect("activate", self.restore_window, window)
        icon.connect("state-changed", self.tray_state_changed, window)
        self.update_title(window)
        self.tray_state_changed(icon, icon.get_state(), window)

    def icon_path(self, window):
        return self.icon_dir / f"{window.get_xid()}.png"

    def update_title(self, window):
        icon = self.icons.get(window)
        if icon is not None:
            icon.set_tooltip_text(window.get_name())

    def panel_applets_changed(self, _settings, _key):
        for window, icon in self.icons.items():
            self.tray_state_changed(icon, icon.get_state(), window)

    def tray_state_changed(self, icon, state, window):
        # Require both a registered XApp monitor and an enabled panel applet.
        visible = state == XApp.StatusIconState.NATIVE and any(
            entry.split(":")[3:4] == ["xapp-status@cinnamon.org"]
            for entry in self.settings.get_strv("enabled-applets")
        )
        icon.set_visible(visible)
        if visible:
            self.hide_taskbar_entry(window)
        else:
            self.show_taskbar_entry(window)

    def x_window(self, window):
        return self.x_display.create_resource_object("window", window.get_xid())

    def hide_taskbar_entry(self, window):
        if window not in self.marked_windows:
            closed = error.CatchError(error.BadWindow)
            self.x_window(window).change_property(
                self.skip_marker, Xatom.CARDINAL, 32, [1], onerror=closed
            )
            # Record ownership before libwnck sends its separate X11 request.
            self.x_display.sync()
            if closed.get_error() is not None:
                return
            self.marked_windows.add(window)

        window.set_skip_tasklist(True)

    def show_taskbar_entry(self, window):
        if window not in self.marked_windows:
            return

        window.set_skip_tasklist(False)
        # Deliver the request before removing the crash-recovery marker.
        Gdk.Display.get_default().sync()
        self.x_window(window).delete_property(
            self.skip_marker, onerror=error.CatchError(error.BadWindow)
        )
        self.x_display.flush()
        self.marked_windows.remove(window)

    def restore_window(self, _icon, button, timestamp, window):
        if button != Gdk.BUTTON_PRIMARY:
            return
        workspace = window.get_workspace()
        if workspace is not None and workspace != self.screen.get_active_workspace():
            workspace.activate(timestamp)
        window.activate(timestamp)

    def remove_icon(self, window, *, closed=False):
        if closed:
            self.marked_windows.discard(window)
        else:
            self.show_taskbar_entry(window)

        icon = self.icons.pop(window, None)
        if icon is None:
            return

        icon.disconnect_by_func(self.tray_state_changed)
        icon.set_visible(False)
        self.icon_path(window).unlink(missing_ok=True)

    def window_closed(self, _screen, window):
        self.remove_icon(window, closed=True)

    def stop(self):
        for window in list(self.icons):
            self.remove_icon(window)
        Gdk.Display.get_default().flush()
        Gtk.main_quit()
        return GLib.SOURCE_REMOVE


def main():
    if not isinstance(Gdk.Display.get_default(), GdkX11.X11Display):
        return

    handle = Wnck.Handle.new(Wnck.ClientType.PAGER)
    screen = handle.get_default_screen()
    screen.force_update()
    with (
        closing(display.Display(Gdk.Display.get_default().get_name())) as x_display,
        TemporaryDirectory(prefix="chrome-pwa-tray-", dir=GLib.get_user_runtime_dir()) as icon_dir,
    ):
        tray = ChromeAppTray(screen, x_display, Path(icon_dir))
        for stop_signal in (signal.SIGHUP, signal.SIGINT, signal.SIGTERM):
            GLibUnix.signal_add(GLib.PRIORITY_DEFAULT, stop_signal, tray.stop)
        Gtk.main()


if __name__ == "__main__":
    main()
