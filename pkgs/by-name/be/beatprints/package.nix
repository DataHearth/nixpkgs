{
  lib,
  python3Packages,
  fetchFromGitHub,
}:
python3Packages.buildPythonApplication rec {
  pname = "BeatPrints";
  version = "1.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "TrueMyst";
    repo = "BeatPrints";
    rev = "v${version}";
    hash = "sha256-KDMt+B3tyh/20N2We82ya90xZJAhCkvbdnTgZDw1GYg=";
  };

  build-system = with python3Packages; [
    poetry-core
  ];

  pythonRelaxDeps = [
    "Pillow"
  ];

  dependencies = with python3Packages; [
    requests
    pylette
    lrclibapi
    fonttools
    questionary
    rich
    toml
    pillow
  ];

  meta = with lib; {
    description = "Create eye-catching, Pinterest-style music posters effortlessly";
    longDescription = ''
      Create eye-catching, Pinterest-style music posters effortlessly. BeatPrints integrates with Spotify and LRClib API to help you design custom posters for your favorite tracks or albums. 🍀
    '';
    homepage = "https://beatprints.readthedocs.io";
    changelog = "https://github.com/TrueMyst/BeatPrints/releases/tag/v${version}";
    mainProgram = "beatprints";
    license = licenses.cc-by-nc-sa-40;
    maintainers = with maintainers; [ DataHearth ];
    platforms = platforms.all;
  };
}
