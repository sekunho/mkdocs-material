{ lib
, fetchFromGitHub
, buildPythonPackage
, hatchling
, setuptools
, mkdocs
, pytest
}:

let
  pname = "mkdocs-redirects";
  version = "v1.2.0";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "mkdocs";
    repo = pname;
    rev = version;
    sha256 = "sha256-+Ti+Z5gL5vVlQDt+KRw9nNHHKhRtEfguQe1K001DK9E=";
  };

  propagatedBuildInputs = [
    mkdocs
  ];

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  checkInputs = [
    pytest
  ];

  # unittestFlagsArray = [ "-v" "-p" "'*tests.py'" "mkdocs" ];
  pythonImportsCheck = [ "mkdocs_redirects" ];
}
