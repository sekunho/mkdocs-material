{
  # eval time deps
  lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, hatchling
, setuptools
  # testing deps
, pytest
}:

buildPythonPackage rec {
  pname = "paginate";
  version = "0.5.6";
  disabled = pythonOlder "3.6";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "Pylons";
    repo = pname;
    rev = "refs/tags/${version}";
    sha256 = "sha256-HZWwOYOCk4mAmz8OnM9hhlf8HA+jC75dYVeo0l4a09o=";
  };

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  checkInputs = [
    pytest
  ];

  # unittestFlagsArray = [ "-v" "-p" "'*tests.py'" "mkdocs" ];
  pythonImportsCheck = [ "paginate" ];
}
