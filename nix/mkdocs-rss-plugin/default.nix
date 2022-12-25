{ lib
, fetchFromGitHub
, buildPythonPackage
, hatchling
, setuptools
, mkdocs
, GitPython
, pytz
, tzdata
, wheel
}:

let
  pname = "mkdocs-rss-plugin";
  version = "1.5.0";
in
buildPythonPackage {
  inherit pname version;
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "Guts";
    repo = pname;
    rev = version;
    sha256 = "sha256-FMJHoA6bccOKa63ynAhhgkoSbj6v9jK9oL0wWOk46nM=";
  };

  propagatedBuildInputs = [
    mkdocs
    GitPython
    pytz
    tzdata
    wheel
  ];

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  pythonImportsCheck = [ "mkdocs_rss_plugin" ];
}
