# NixOS User Configuration
#
# System configuration for the NixOS user profile, intended for use in
# Windows WSL. Provides Docker for containerised development and
# lazygit for a terminal-based Git workflow.
{
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../modules/docker.nix
    ../../modules/headlamp.nix
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      nss
      openssl
      curl
      expat
      # Common JetBrains dependencies
      libxml2
      libssh
      libkrb5
      keyutils
      # X11/Graphics libs (even for backend, some helpers need these)
      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXtst
      xorg.libXi
      glib
      nss
      at-spi2-atk
      libdrm
      mesa
      alsa-lib
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      hoppscotch
      lazygit
      lazydocker
      k9s
      k0sctl
      kdePackages.dolphin
      kubeseal
      kubelogin
      jetbrains.rider
      dotnet-sdk_10
      mercurial
      nodejs
      vscode
      firefox-devedition
      google-chrome
      microsoft-edge
      sourcegit
    ];

    sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
    };
  };

  security.pki = {
    certificates = [
      ''
        -----BEGIN CERTIFICATE-----
        MIID0zCCArugAwIBAgIJAOAxCsaCPHvrMA0GCSqGSIb3DQEBCwUAMBQxEjAQBgNV
        BAMTCWxvY2FsaG9zdDAeFw0yNjA0MDgxMTI0NDRaFw0yNzA0MDgxMTI0NDRaMBQx
        EjAQBgNVBAMTCWxvY2FsaG9zdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
        ggEBANux/u3Vtd9zeRgiloDfD1P1N191D+bGZxJOiA5t2qD1xR0oSd5wJsEO9kpc
        EjHndDYb1V7gZuYEXEGHT1Wtopqw+P1PhDU0dhQJWxbEbzGD9B7b47JMWfzUEnQk
        CX4il4XSLQFXvlN2ujSEnDUUwunCn+3+fd42aeMD6gTVbuN6ObN4nGfoIrEhuSSV
        JHozGNfRRDVWqDfjkOW2+nKTNHebz6sFZt30G3FzNbrSe158Qw1RyexkU1QQa0od
        VFLnF7lKwcei1x+4eZU7154ivJZJBeIPXmQaH46DwvtraXq6U1YeTSlaTny77eh/
        CkF3S661xAYQrqfnTae9FEi3hsUCAwEAAaOCASYwggEiMAwGA1UdEwEB/wQCMAAw
        DgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMBMIGABgNVHREB
        Af8EdjB0gglsb2NhbGhvc3SCDyouZGV2LmxvY2FsaG9zdIIOKi5kZXYuaW50ZXJu
        YWyCFGhvc3QuZG9ja2VyLmludGVybmFsghhob3N0LmNvbnRhaW5lcnMuaW50ZXJu
        YWyHBH8AAAGHEAAAAAAAAAAAAAAAAAAAAAEwDwYKKwYBBAGCN1QBAQQBBjApBgNV
        HQ4EIgQgAyFSCBrcXhpWYyRAC89hO1ZgnoZGYYEF1wHkLKLeaoMwKwYDVR0jBCQw
        IoAgAyFSCBrcXhpWYyRAC89hO1ZgnoZGYYEF1wHkLKLeaoMwDQYJKoZIhvcNAQEL
        BQADggEBABzf/CX5cweMe+Sc9kxGVUGqv8DYNbDN9XwqA4I3u5wp0GbQfAiWEJr5
        OVHZMPiTDEUIURZmPGX66unAxR5YgaFb9X8TCLR8uQnDnuDypsbnvPIHkKJBGlQy
        25yvMJLAV+yasNIJug4/xdOIMgXJhIw7uzWVU/oPnHulbZXfqyuSV+faaXw/PL5O
        5fFL9YmZj/jzQI7hzpArCYilz2xlU4pO8/phFqiGJs+LwrZGZm5Ez5mCsVS6lIGG
        S4czzmIQDqdZk2ZY4jlfAXp/gea8ZXyYObAZtsav8cuOWqHlfw6So0xbwm6eZyxC
        prpVUt7mOqO6/6Rnl9s7uE3BXnOf2Bc=
        -----END CERTIFICATE-----
      ''
    ];
    # certificateFiles = [/home/nixos/.local/share/mkcert/rootCA.pem];
  };

  users.users.${user} = {
    isNormalUser = true;
    # hashedPassword (not initialPassword) so xrdp can always authenticate — initialPassword only applies on first account creation
    hashedPassword = "$6$3BGVF3pHFaYKQrs1$Ac6nlm55Mi.80KdRhvlr9wk4V80X/CE2cof8YRba5Mz6Kqgzl8uzq.Bd78qKh8Tsq4FGQuRsmhedOVlH.Zuvx1";
    description = "NixOS";
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
    linger = true;
  };
}
