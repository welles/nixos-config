{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "kwin-mousetiler";
  version = "v6.3.2";

  src = fetchFromGitHub {
    owner = "rxappdev";
    repo = "MouseTiler";
    rev = version;
    sha256 = "05yrdgjllikpbjhmw0fvf85rhbg4lmbyldhv62lkkf84gw8mby6p";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/kwin/scripts/mousetiler
    cp -r * $out/share/kwin/scripts/mousetiler/
  '';
}
