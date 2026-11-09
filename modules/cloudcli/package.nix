# CloudCLI UI (formerly Claude Code UI), built from source.
#
# Install scripts are skipped (they download Electron, ripgrep and prebuilt
# binaries); the native modules the server needs are rebuilt from source
# instead, and @vscode/ripgrep gets the ripgrep from nixpkgs.
{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  nodejs_22,
  python3,
  pkg-config,
  makeWrapper,
  ripgrep,
}:
buildNpmPackage (finalAttrs: {
  pname = "cloudcli";
  version = "1.37.8";

  src = fetchFromGitHub {
    owner = "siteboon";
    repo = "claudecodeui";
    tag = "v${finalAttrs.version}";
    hash = "sha256-6kZHlgf8A/s2UuE0OXhwB9EmaA69yxPcFPujh+W+T6k=";
  };

  npmDepsHash = "sha256-o8KC53I6u9vx3n3LprJ5XG+mj4UTpaM+TKUM+3kwqeI=";

  nodejs = nodejs_22;

  nativeBuildInputs = [python3 pkg-config makeWrapper];

  # npm ci already skips install scripts; skip them in the rebuild too, so
  # Electron and ripgrep are not downloaded
  npmRebuildFlags = ["--ignore-scripts"];
  makeCacheWritable = true;

  env = {
    ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
    HUSKY = "0";
  };

  # The native modules the server loads at runtime
  preBuild = ''
    npm rebuild --foreground-scripts better-sqlite3 bcrypt node-pty
  '';

  postInstall = ''
    lib=$out/lib/node_modules/@cloudcli-ai/cloudcli
    mkdir -p $lib/node_modules/@vscode/ripgrep/bin
    ln -sf ${lib.getExe ripgrep} $lib/node_modules/@vscode/ripgrep/bin/rg

    # Electron and the other development tools are not needed at runtime
    rm -rf $lib/node_modules/electron $lib/node_modules/electron-builder

    makeWrapper ${lib.getExe finalAttrs.nodejs} $out/bin/cloudcli-server \
      --add-flags $lib/dist-server/server/index.js
  '';

  meta = {
    description = "Web UI for Claude Code, Cursor CLI and Codex";
    homepage = "https://github.com/siteboon/claudecodeui";
    license = lib.licenses.agpl3Only;
    mainProgram = "cloudcli-server";
  };
})
