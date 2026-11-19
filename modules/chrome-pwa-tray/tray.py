#!/usr/bin/env python3
import re
import signal
from contextlib import closing
from dataclasses import dataclass
from math import pi
from pathlib import Path
from tempfile import TemporaryDirectory
from uuid import uuid4

import cairo
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
UNREAD_COUNT = re.compile(r"@unreadCountPattern@", re.ASCII)


def unread_count(title):
    match = UNREAD_COUNT.search(title or "")
    if match is None:
        return None
    count = match[1]
    # Match the window list's parseInt(count) > 0 without imposing a digit limit.
    if count.rstrip("+").split(".", 1)[0].lstrip("0"):
        return count
    return None


def save_icon(pixbuf, count, path):
    if count is None:
        pixbuf.savev(str(path), "png", [], [])
        return

    size = 64
    surface = cairo.ImageSurface(cairo.FORMAT_ARGB32, size, size)
    context = cairo.Context(surface)
    width, height = pixbuf.get_width(), pixbuf.get_height()
    scale = size / max(width, height)
    context.save()
    context.translate((size - width * scale) / 2, (size - height * scale) / 2)
    context.scale(scale, scale)
    Gdk.cairo_set_source_pixbuf(context, pixbuf, 0, 0)
    context.paint()
    context.restore()

    radius = 16
    inset = 1
    font_size = 25
    text_padding = 8
    max_text_width = size - 2 * inset - text_padding
    context.select_font_face("Sans", cairo.FONT_SLANT_NORMAL, cairo.FONT_WEIGHT_BOLD)
    context.set_font_size(font_size)
    text = context.text_extents(count)
    if text.width > max_text_width:
        context.set_font_size(font_size * max_text_width / text.width)
        text = context.text_extents(count)

    badge_width = max(2 * radius, text.width + text_padding)
    right = size - inset
    center_y = inset + radius
    context.arc(right - radius, center_y, radius, -pi / 2, pi / 2)
    context.arc(right - badge_width + radius, center_y, radius, pi / 2, 3 * pi / 2)
    context.close_path()
    context.set_source_rgb(0.91, 0.29, 0.22)
    context.fill()

    context.set_source_rgb(1, 1, 1)
    context.move_to(
        right - (badge_width + text.width) / 2 - text.x_bearing,
        center_y - text.height / 2 - text.y_bearing,
    )
    context.show_text(count)
    surface.write_to_png(str(path))


@dataclass
class TrayIcon:
    status: XApp.StatusIcon
    image: Path | None = None
    count: str | None = None


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

        icon = XApp.StatusIcon.new_with_name("chrome-pwa-tray")
        icon.set_visible(False)
        self.icons[window] = TrayIcon(icon)
        icon.connect("activate", self.restore_window, window)
        icon.connect("state-changed", self.tray_state_changed, window)
        self.update_title(window)
        self.tray_state_changed(icon, icon.get_state(), window)

    def update_title(self, window):
        icon = self.icons.get(window)
        if icon is None:
            return

        title = window.get_name()
        icon.status.set_tooltip_text(title)
        count = unread_count(title)
        if icon.image is not None and icon.count == count:
            return

        # Cinnamon reloads the image when the XApp icon path changes.
        image = self.icon_dir / f"{uuid4().hex}.png"
        save_icon(window.get_icon(), count, image)
        icon.status.set_icon_name(str(image))
        if icon.image is not None:
            icon.image.unlink(missing_ok=True)
        icon.image = image
        icon.count = count

    def panel_applets_changed(self, _settings, _key):
        for window, icon in self.icons.items():
            self.tray_state_changed(icon.status, icon.status.get_state(), window)

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

        icon.status.disconnect_by_func(self.tray_state_changed)
        icon.status.set_visible(False)
        if icon.image is not None:
            icon.image.unlink(missing_ok=True)

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
