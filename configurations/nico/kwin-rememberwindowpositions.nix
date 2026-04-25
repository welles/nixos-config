{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "kwin-rememberwindowpositions";
  version = "v6.0.0";

  src = fetchFromGitHub {
    owner = "rxappdev";
    repo = "RememberWindowPositions";
    rev = version;
    sha256 = "0fh31w0dgnjdqgbsnsw3zsxammb0m177m6x9iwbhn628dysv14bm";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/kwin/scripts/rememberwindowpositions
    cp -r * $out/share/kwin/scripts/rememberwindowpositions/
  '';
}
