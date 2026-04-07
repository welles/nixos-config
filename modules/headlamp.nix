# Headlamp Kubernetes Dashboard
#
# Packages and installs Headlamp, a browser-based Kubernetes UI, from
# the upstream pre-built Linux release. Headlamp is an Electron
# application; the bundled Chromium sandbox is disabled via
# --no-sandbox because WSL kernels do not expose the required
# user-namespace support.
{ pkgs, ... }:
let
  version = "0.41.0";

  headlamp = pkgs.stdenv.mkDerivation {
    pname = "headlamp";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/kubernetes-sigs/headlamp/releases/download/v${version}/Headlamp-${version}-linux-x64.tar.gz";
      hash = "sha256-GmBhXVMmNSsIyU2S7eU337xJ0W2OCPXf2uZCPqOfgYQ=";
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
      pkgs.makeWrapper
    ];

    buildInputs = with pkgs; [
      alsa-lib
      atk
      cairo
      cups
      expat
      gdk-pixbuf
      glib
      gtk3
      libdrm
      mesa
      nss
      pango
      xorg.libX11
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXrandr
      xorg.libxcb
    ];

    # Electron bundles its own Chromium-specific libraries (libffmpeg,
    # libEGL, libvk_swiftshader, …) that are not in nixpkgs; skip them
    # rather than failing the build.
    autoPatchelfIgnoreMissingDeps = true;

    sourceRoot = "Headlamp-${version}-linux-x64";

    installPhase = ''
      runHook preInstall

      mkdir -p $out/opt/headlamp $out/bin
      cp -r . $out/opt/headlamp/

      # Expose bundled Electron libs at runtime and apply WSL workarounds:
      #   --no-sandbox: WSL kernels lack user-namespace support for the
      #                 Chromium sandbox.
      #   --disable-gpu: WSL has no GPU-accessible GL stack; without this
      #                  ANGLE tries to dlopen libGL.so.1, fails, and the
      #                  process aborts with SIGTRAP.  SwiftShader software
      #                  rendering is used instead.
      #   --disable-features=MediaSessionService: suppresses repeated
      #                  D-Bus "Failed to connect to socket /run/user/…/bus"
      #                  errors that occur because WSL does not run a user
      #                  session bus by default.
      makeWrapper $out/opt/headlamp/headlamp $out/bin/headlamp \
        --add-flags "--no-sandbox" \
        --add-flags "--disable-gpu" \
        --add-flags "--disable-features=MediaSessionService" \
        --prefix LD_LIBRARY_PATH : "$out/opt/headlamp"

      runHook postInstall
    '';

    meta = {
      description = "Kubernetes UI that lets you see what is happening in your cluster";
      homepage = "https://headlamp.dev";
      platforms = ["x86_64-linux"];
    };
  };
in {
  environment.systemPackages = [headlamp];
}
