{ lib
, fetchFromGitHub
, buildPythonPackage
, hatchling
, setuptools
, mkdocs
, PyGithub
}:

let
  pname = "mkdocs-git-committers-plugin";
  version = "0.2.2";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "byrnereese";
    repo = pname;
    rev = version;
    sha256 = "sha256-5PXY3fsqwI6EPS8n8im/i9kAxMHW1FN4IqFLgrCnl4w=";
  };

  propagatedBuildInputs = [
    mkdocs
    PyGithub
  ];

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  # pythonImportsCheck = [ "mkdocs_git_committers_plugin" ];
}
