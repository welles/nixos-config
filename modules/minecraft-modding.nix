# Minecraft mod development (Fabric/NeoForge via Gradle). `./gradlew runClient`
# starts Minecraft with LWJGL natives downloaded from Maven, which expect
# graphics, input and audio libraries at FHS paths. Provide them via nix-ld
# (same set Prism Launcher wraps its game instances with) and persist the
# Gradle cache so dependencies are not re-downloaded after every boot.
{
  lib,
  pkgs,
  user,
  persistRoot ? null,
  ...
}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libGL
      glfw
      openal
      alsa-lib
      libjack2
      libpulseaudio
      pipewire
      libx11
      libxcursor
      libxext
      libxrandr
      libxxf86vm
      libxkbcommon
      wayland
      udev
      vulkan-loader
      flite
    ];
  };

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".gradle"];
  };
}
