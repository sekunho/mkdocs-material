{ lib
, fetchFromGitHub
, buildPythonPackage
, hatchling
, setuptools
, mkdocs
, htmlmin
, jsmin
, csscompressor
}:

let
  pname = "mkdocs-minify-plugin";
  version = "0.6.2";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "byrnereese";
    repo = pname;
    rev = version;
    sha256 = "sha256-ABoLt5sFpt8Hm07tkqeAcs63ZvJ4vTbGw4QRYVYpMEA=";
  };

  propagatedBuildInputs = [
    mkdocs
    htmlmin
    jsmin
    csscompressor
  ];

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  # unittestFlagsArray = [ "-v" "-p" "'*tests.py'" "mkdocs" ];
  # pythonImportsCheck = [ "mkdocs_redirects" ];
}
