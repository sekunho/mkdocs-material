{
  # eval time deps
  lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, hatchling
, setuptools
  # bruh
, markdown2
, beautifulsoup4
, pyquery

  # testing deps
, unittestCheckHook
}:

buildPythonPackage rec {
  pname = "readtime";
  version = "2.0.0";
  disabled = pythonOlder "3.6";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "alanhamlett";
    repo = pname;
    rev = "refs/tags/${version}";
    sha256 = "sha256-/TWl5yRFscp7iEIZhKLyMLgl3mOh5MaQWJyjoPDD/zA=";
  };

  propagatedBuildInputs = [
    markdown2
    pyquery
    beautifulsoup4
  ];

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  checkInputs = [
    unittestCheckHook
  ];

  # unittestFlagsArray = [ "-v" "-p" "'*tests.py'" "mkdocs" ];
  pythonImportsCheck = [ "readtime" ];
}
