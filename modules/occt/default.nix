{
  pkgs,
  lib,
  config,
  ...
}: let
  nvidiaEnabled = lib.elem "nvidia" config.services.xserver.videoDrivers;
  primeOffload = config.hardware.nvidia.prime.offload.enable;
  pname = "occt";

  src = pkgs.fetchurl {
    url = "https://dl.ocbase.com/linux/per/stable/OCCT";
    hash = "sha256-yvKg/ariuICx5obWzWynbKSl47AL0A/gXsmoPYaaiek=";
    name = "OCCT";
  };

  icon = pkgs.fetchurl {
    url = "https://www.ocbase.com/images/new/logomark.occt.svg";
    hash = "sha256-GLivAu4/epbgXGRNc8lljhBQ8nIJob/2g5InXqZaUCA=";
    name = "${pname}.svg";
  };

  occt-env = pkgs.runCommand "occt-env" {} ''
    mkdir -p $out/opt/occt
    install -m 755 ${src} $out/opt/occt/OCCT
    touch $out/opt/occt/disable_update
    touch $out/opt/occt/app_folder_in_home
  '';

  desktopItem = pkgs.makeDesktopItem {
    name = pname;
    desktopName = "OCCT";
    comment = "All-in-one stability, stress test, benchmark and monitoring tool for PC";
    exec = pname;
    icon = pname;
    categories = ["System" "Monitor"];
  };

  occt = pkgs.buildFHSEnv {
    name = pname;
    targetPkgs = _:
      [
        occt-env
        pkgs.icu
        pkgs.openssl
        pkgs.zlib
        pkgs.libGL
        pkgs.mesa
        pkgs.fontconfig
        pkgs.freetype
        pkgs.dbus
        pkgs.glib
        pkgs.stdenv.cc.cc.lib
        pkgs.libx11
        pkgs.libxext
        pkgs.libxrender
        pkgs.libxi
        pkgs.libxcursor
        pkgs.libxrandr
        pkgs.libxinerama
        pkgs.libxfixes
        pkgs.libxcomposite
        pkgs.libice
        pkgs.libsm
        pkgs.vulkan-loader
      ]
      ++ lib.optionals nvidiaEnabled [
        config.hardware.nvidia.package
      ];
    runScript = "/opt/occt/OCCT";

    # On PRIME offload systems, force all rendering (including the UE5 gpu3d
    # child process) onto the NVIDIA GPU. Without these vars the Vulkan loader
    # picks the Intel ICD and UE5 crashes immediately.
    #
    # VK_ICD_FILENAMES is set explicitly to prevent ICD duplication: the loader
    # would otherwise find the same nvidia_icd.json twice (once from the FHS
    # env's /usr/share/vulkan/icd.d/ and again from the host's
    # /run/opengl-driver via XDG_DATA_DIRS), causing UE5 to see duplicate
    # Vulkan devices and crash during device initialisation.
    profile = lib.optionalString (nvidiaEnabled && primeOffload) ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
    '';

    # /opt/occt is a read-only nix store bind-mount inside bwrap; overlay a
    # tmpfs so OCCT can write crash logs and temp files there, then re-bind the
    # individual files it actually needs as read-only.
    extraBwrapArgs = [
      "--tmpfs"
      "/opt/occt"
      "--ro-bind"
      "${occt-env}/opt/occt/OCCT"
      "/opt/occt/OCCT"
      "--ro-bind"
      "${occt-env}/opt/occt/disable_update"
      "/opt/occt/disable_update"
      "--ro-bind"
      "${occt-env}/opt/occt/app_folder_in_home"
      "/opt/occt/app_folder_in_home"
    ];

    extraInstallCommands = ''
      install -Dm644 ${desktopItem}/share/applications/${pname}.desktop \
        $out/share/applications/${pname}.desktop
      install -Dm644 ${icon} \
        $out/share/icons/hicolor/scalable/apps/${pname}.svg
    '';

    meta = with lib; {
      description = "All-in-one stability, stress test, benchmark and monitoring tool for PC";
      homepage = "https://www.ocbase.com/";
      license = licenses.unfree;
      platforms = ["x86_64-linux"];
      mainProgram = pname;
    };
  };
in {
  environment.systemPackages = [occt];
}
