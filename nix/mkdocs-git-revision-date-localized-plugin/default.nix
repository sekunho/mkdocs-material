{ lib
, fetchFromGitHub
, buildPythonPackage
, hatchling
, setuptools
, wheel
, mkdocs
, GitPython
, babel
}:

let
  pname = "mkdocs-git-revision-date-localized-plugin";
  version = "v1.1.0";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "timvink";
    repo = pname;
    rev = version;
    sha256 = "sha256-xg60gTxdZFiWXnfA5mukBhKysZgteXadQieTID6nAXA=";
  };

  propagatedBuildInputs = [
    mkdocs
    GitPython
  ];

  nativeBuildInputs = [
    hatchling
    setuptools
    wheel
  ];

  checkInputs = [
    babel
  ];

  # unittestFlagsArray = [ "-v" "-p" "'"*tests.py'" "mkdocs" ];
  pythonImportsCheck = [ "mkdocs_git_revision_date_localized_plugin" ];
}
