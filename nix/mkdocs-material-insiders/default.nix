{ lib
, callPackage
, buildPythonPackage
, hatchling
, hatch-nodejs-version
, hatch-requirements-txt
, setuptools
, jinja2
, markdown
, mkdocs
, mkdocs-material-extensions
, pygments
, pymdown-extensions
, pythonOlder
, requests
, regex
, paginate
, readtime
, cairosvg
, mkdocs-rss-plugin
, mkdocs-redirects
, mkdocs-git-revision-date-localized-plugin
, mkdocs-git-committers-plugin
, mkdocs-minify-plugin
}:

let
  pname = "mkdocs-material-insiders";
  version = "9.1.14-insiders-4.35.1";
in
  buildPythonPackage rec {
    inherit pname;
    inherit version;

    format = "pyproject";
    disabled = pythonOlder "3.7";

    nativeBuildInputs = [
      hatchling
      hatch-nodejs-version
      hatch-requirements-txt
      setuptools
    ];

    src = fetchGit {
      url = "ssh://git@github.com/squidfunk/${pname}.git";
      ref = "master";
      rev = "a5c984d0c2509cf576693b810931643c61fc6193";
    };

    propagatedBuildInputs = [
      jinja2
      markdown
      mkdocs
      mkdocs-material-extensions
      pygments
      pymdown-extensions
      requests
      regex
      paginate
      readtime
      cairosvg

      mkdocs-rss-plugin
      mkdocs-redirects
      mkdocs-git-revision-date-localized-plugin
      mkdocs-git-committers-plugin
      mkdocs-minify-plugin
    ];

    # No tests for python
    doCheck = false;

    pythonImportsCheck = [
      "mkdocs"
    ];

    meta = with lib; {
      description = "mkdocs-material for insiders";
      homepage = "https://github.com/squidfunk/mkdocs-material-insiders";
      maintainers = with maintainers; [];
      # license = licenses.unfree;
    };
  }

