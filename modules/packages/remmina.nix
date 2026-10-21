{
  lib,
  pkgs,
  user,
  persistRoot,
  ...
}: {
  environment.systemPackages = [pkgs.remmina];

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/remmina"];
  };

  # German keyboard layout (0x0407) for RDP connections instead of the
  # client's keymap, which Remmina often detects as "us" (e.g. on Wayland).
  # remmina.pref is written by Remmina itself, so only these keys are set on
  # every activation; this also restores them on hosts where ~/.config is
  # not persisted.
  home-manager.users.${user} = {lib, ...}: {
    home.activation.remminaKeyboardLayout = lib.hm.dag.entryAfter ["writeBoundary"] ''
      pref="$HOME/.config/remmina/remmina.pref"
      run mkdir -p "$(dirname "$pref")"
      run ${pkgs.crudini}/bin/crudini --ini-options=nospace --set "$pref" remmina_pref rdp_keyboard_layout 407
      run ${pkgs.crudini}/bin/crudini --ini-options=nospace --set "$pref" remmina_pref rdp_use_client_keymap 0
    '';
  };
}
