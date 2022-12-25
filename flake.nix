{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      hatch-requirements-txt = pkgs.callPackage ./nix/hatch-requirements-txt.nix {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        hatchling = pkgs.python310Packages.hatchling;
      };

      mkdocs-material-extensions = pkgs.callPackage ./nix/mkdocs-material-extensions {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        hatchling = pkgs.python310Packages.hatchling;
      };

      pymdown-extensions = pkgs.callPackage ./nix/pymdown-extensions {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        hatchling = pkgs.python310Packages.hatchling;
        pytestCheckHook = pkgs.python310Packages.pytestCheckHook;
        markdown = pkgs.python310Packages.markdown;
        pyyaml = pkgs.python310Packages.pyyaml;
        pygments = pkgs.python310Packages.pygments;
      };

      paginate = pkgs.callPackage ./nix/paginate {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        pythonOlder = pkgs.lib.versionOlder "3.10";
        hatchling = pkgs.python310Packages.hatchling;
        setuptools = pkgs.python310Packages.setuptools;
        pytest = pkgs.python310Packages.pytest;
      };

      readtime = pkgs.callPackage ./nix/readtime {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        pythonOlder = pkgs.lib.versionOlder "3.10";
        hatchling = pkgs.python310Packages.hatchling;
        setuptools = pkgs.python310Packages.setuptools;
        markdown2 = pkgs.python310Packages.markdown2;
        beautifulsoup4 = pkgs.python310Packages.beautifulsoup4;
        pyquery = pkgs.python310Packages.pyquery;
        unittestCheckHook = pkgs.python310Packages.unittestCheckHook;
      };

      mkdocs142 = pkgs.callPackage ./nix/mkdocs {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        pythonOlder = pkgs.lib.versionOlder "3.10";
        hatchling = pkgs.python310Packages.hatchling;
        setuptools = pkgs.python310Packages.setuptools;
        click = pkgs.python310Packages.click;
        jinja2 = pkgs.python310Packages.jinja2;
        ghp-import = pkgs.ghp-import;
        importlib-metadata = pkgs.python310Packages.importlib-metadata;
        markdown = pkgs.python310Packages.markdown;
        mergedeep = pkgs.python310Packages.mergedeep;
        packaging = pkgs.python310Packages.packaging;
        pyyaml = pkgs.python310Packages.pyyaml;
        pyyaml-env-tag = pkgs.python310Packages.pyyaml-env-tag;
        watchdog = pkgs.python310Packages.watchdog;
        babel = pkgs.python310Packages.babel;
        mock = pkgs.python310Packages.mock;
        unittestCheckHook = pkgs.python310Packages.unittestCheckHook;
      };

      # Plugins
      mkdocs-rss-plugin = pkgs.callPackage ./nix/mkdocs-rss-plugin {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        hatchling = pkgs.python310Packages.hatchling;
        mkdocs = mkdocs142;
        GitPython = pkgs.python310Packages.GitPython;
        pytz = pkgs.python310Packages.pytz;
        tzdata = pkgs.python310Packages.tzdata;
        wheel = pkgs.python310Packages.wheel;
        setuptools = pkgs.python310Packages.setuptools;
      };

      mkdocs-git-revision-date-localized-plugin = pkgs.callPackage ./nix/mkdocs-git-revision-date-localized-plugin {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;

        wheel = pkgs.python310Packages.wheel;
        hatchling = pkgs.python310Packages.hatchling;
        setuptools = pkgs.python310Packages.setuptools;

        mkdocs = mkdocs142;
        GitPython = pkgs.python310Packages.GitPython;
        babel = pkgs.python310Packages.babel;
      };

      mkdocs-redirects = pkgs.callPackage ./nix/mkdocs-redirects {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        hatchling = pkgs.python310Packages.hatchling;
        setuptools = pkgs.python310Packages.setuptools;
        mkdocs = mkdocs142;
        pytest = pkgs.python310Packages.pytest;
      };

      mkdocs-git-committers-plugin = pkgs.callPackage ./nix/mkdocs-git-committers-plugin {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        hatchling = pkgs.python310Packages.hatchling;
        setuptools = pkgs.python310Packages.setuptools;
        mkdocs = mkdocs142;
        PyGithub = pkgs.python310Packages.PyGithub;
      };

      mkdocs-minify-plugin = pkgs.callPackage ./nix/mkdocs-minify-plugin {
        lib = pkgs.lib;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        fetchFromGitHub = pkgs.fetchFromGitHub;
        hatchling = pkgs.python310Packages.hatchling;
        setuptools = pkgs.python310Packages.setuptools;

        mkdocs = mkdocs142;
        jsmin = pkgs.python310Packages.jsmin;
        htmlmin = pkgs.python310Packages.htmlmin;
        csscompressor = pkgs.python310Packages.csscompressor;
      };

      mkdocs-material-insiders = pkgs.callPackage ./nix/mkdocs-material-insiders {
        lib = pkgs.lib;
        callPackage = pkgs.callPackage;
        buildPythonPackage = pkgs.python310.pkgs.buildPythonPackage;
        hatchling = pkgs.python310Packages.hatchling;
        hatch-nodejs-version = pkgs.python310Packages.hatch-nodejs-version;
        hatch-requirements-txt = hatch-requirements-txt;
        setuptools = pkgs.python310Packages.setuptools;
        jinja2 = pkgs.python310Packages.jinja2;
        markdown = pkgs.python310Packages.markdown;
        mkdocs = mkdocs142;
        mkdocs-material-extensions = mkdocs-material-extensions;
        pygments = pkgs.python310Packages.pygments;
        pymdown-extensions = pymdown-extensions;
        pythonOlder = pkgs.lib.versionOlder "3.10";
        requests = pkgs.python310Packages.requests;
        regex = pkgs.python310Packages.regex;
        cairosvg = pkgs.python310Packages.cairosvg;

        inherit paginate;
        inherit readtime;
        inherit mkdocs-rss-plugin;
        inherit mkdocs-redirects;
        inherit mkdocs-git-revision-date-localized-plugin;
        inherit mkdocs-git-committers-plugin;
        inherit mkdocs-minify-plugin;
      };
    in {
      packages.${system} = {
        mkdocs = mkdocs142;

        inherit paginate;
        inherit readtime;
        inherit mkdocs-redirects;
        inherit mkdocs-rss-plugin;
        inherit mkdocs-material-insiders;
        inherit mkdocs-git-revision-date-localized-plugin;
        inherit mkdocs-git-committers-plugin;
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ mkdocs-material-insiders ];
      };
    };
}
