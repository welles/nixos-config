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
      #   dbus-run-session: WSL does not run a persistent user session bus.
      #                  Electron (Chromium) has multiple D-Bus callers
      #                  (notifications, file-chooser, media keys, …); when
      #                  none of them can connect they trigger a CHECK()
      #                  assertion and the process aborts with SIGTRAP.
      #                  dbus-run-session starts a private throwaway bus for
      #                  the lifetime of the process, satisfying all callers.
      #   --no-sandbox:  WSL kernels lack user-namespace support for the
      #                  Chromium sandbox.
      #   --disable-gpu: WSL has no GPU-accessible GL stack; without this
      #                  ANGLE tries to dlopen libGL.so.1, fails, and the
      #                  GPU subprocess aborts with SIGTRAP.  SwiftShader
      #                  software rendering is used instead.
      #   --disable-dev-shm-usage: WSL limits /dev/shm; Chromium uses it
      #                  for IPC shared memory.  This flag routes shared
      #                  memory through /tmp instead, preventing crashes
      #                  when the shared-memory region cannot be allocated.
      #   --in-process-gpu: Electron still spawns a GPU subprocess even
      #                  when --disable-gpu is set (for compositing).  That
      #                  subprocess crashes on WSL because namespace-based
      #                  sandbox initialisation fails (SIGTRAP).  Running
      #                  the GPU logic as a thread in the main process
      #                  eliminates the subprocess entirely.
      makeWrapper ${pkgs.dbus}/bin/dbus-run-session $out/bin/headlamp \
        --add-flags "$out/opt/headlamp/headlamp" \
        --add-flags "--no-sandbox" \
        --add-flags "--disable-gpu" \
        --add-flags "--disable-dev-shm-usage" \
        --add-flags "--in-process-gpu" \
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
