{
  # eval time deps
  lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, hatchling
, setuptools
  # runtime deps
, click
, ghp-import
, importlib-metadata
, jinja2
, markdown
, mergedeep
, packaging
, pyyaml
, pyyaml-env-tag
, watchdog
  # testing deps
, babel
, mock
, unittestCheckHook
}:

buildPythonPackage rec {
  pname = "mkdocs";
  version = "1.4.2";
  disabled = pythonOlder "3.6";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = "refs/tags/${version}";
    sha256 = "sha256-/NxiKbCd2acYcNe5ww3voM9SGVE2IDqknngqApkDbNs=";
  };

  nativeBuildInputs = [
    hatchling
    setuptools
  ];

  propagatedBuildInputs = [
    click
    jinja2
    markdown
    mergedeep
    pyyaml
    pyyaml-env-tag
    ghp-import
    importlib-metadata
    watchdog
    packaging
  ];

  checkInputs = [
    unittestCheckHook
    babel
    mock
  ];

  unittestFlagsArray = [ "-v" "-p" "'*tests.py'" "mkdocs" ];
  pythonImportsCheck = [ "mkdocs" ];

  # https://github.com/NixOS/nixpkgs/issues/31684
  patches = [ ./mkdocs-markdown-bump.patch ];

  meta = with lib; {
    description = "Project documentation with Markdown / static website generator";
    longDescription = ''
      MkDocs is a fast, simple and downright gorgeous static site generator that's
      geared towards building project documentation. Documentation source files
      are written in Markdown, and configured with a single YAML configuration file.
      MkDocs can also be used to generate general-purpose websites.
    '';
    homepage = "http://mkdocs.org/";
    license = licenses.bsd2;
    platforms = platforms.unix;
    maintainers = with maintainers; [ rkoe ];
  };
}
