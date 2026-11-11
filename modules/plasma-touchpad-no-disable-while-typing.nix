# Keep the touchpad active while keys are held, so games can be played with
# WASD on the keyboard and the touchpad for looking around. libinput's
# "disable while typing" otherwise ignores the touchpad as long as a key of
# the built-in keyboard is down.
{touchpads, ...}: {
  home-manager.sharedModules = [
    {
      programs.plasma.input.touchpads =
        map (touchpad: touchpad // {disableWhileTyping = false;}) touchpads;
    }
  ];
}
