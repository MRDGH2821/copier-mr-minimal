{pkgs, ...}: {
  projectRootFile = "flake.nix";

  programs = {
    actionlint.enable = true;
    alejandra = {
      enable = true;
      priority = 10;
    };
    beautysh.enable = true;
    deadnix.enable = true;
    djlint.enable = true;
    dockerfmt.enable = true;
    dockfmt.enable = true;
    dos2unix.enable = true;
    flake-edit.enable = true;
    genemichaels.enable = true;
    just.enable = true;
    keep-sorted.enable = true;
    oxfmt = {
      enable = true;
      priority = 80;
    };
    nbstripout.enable = true;
    nixf-diagnose.enable = true;
    nixfmt = {
      enable = true;
      priority = 1;
    };
    nixpkgs-fmt.enable = false;
    prettier = {
      enable = true;
      priority = 100;
      includes = ["*"];
      excludes = [
        # keep-sorted start
        "*.*ignore"
        "*.aac"
        "*.docx"
        "*.envrc"
        "*.jinja"
        "*.jpg"
        "*.lock"
        "*.mp4"
        "*.nix"
        "*.pdf"
        "*.png"
        "*.pptx"
        "*.py"
        "*.toml"
        "*.txt"
        "*.typ"
        ".envrc"
        "LICENCE"
        "LICENSE"
        "justfile"
        # keep-sorted end
      ];
    };
    ruff-check = {
      enable = true;
      priority = 8;
    };
    ruff-format = {
      enable = true;
      priority = 9;
    };
    shellcheck.enable = true;
    shfmt.enable = true;
    sqlfluff.enable = true;
    sqlfluff-lint.enable = true;
    statix.enable = true;
    taplo.enable = true;
    toml-sort = {
      enable = true;
      priority = 0;
    };
    typos = {
      enable = true;
      excludes = [
        # keep-sorted start
        "**/.cspell.json"
        "CHANGELOG.md"
        # keep-sorted end
      ];
    };
    typstyle = {
      enable = true;
      priority = 1;
    };
    xmllint.enable = true;
    yamllint = {
      enable = true;
      settings = {
        extends = "default";
        rules = {
          line-length = "disable";
          comments = "disable";
          truthy = "disable";
        };
      };
    };
    zizmor.enable = true;
  };

  settings = {
    "allow-missing-formatter" = true;
    excludes = ["**/skills/**"];
    formatter = {
      toml-sort = {
        options = [
          "--sort-table-keys"
          "--sort-inline-tables"
        ];
      };
      cspell-sort = {
        command = "${pkgs.yq-go}/bin/yq";
        options = [
          "-i"
          ".words|= sort_by(downcase)|.ignorePaths|=sort_by(downcase)"
        ];
        no-positional-arg-support = true;
        includes = [
          # keep-sorted start
          "**/.CSpell*"
          "**/.cspell*"
          "**/cSpell*"
          "**/cspell*"
          ".CSpell*"
          ".cspell*"
          "cspell*"
          # keep-sorted end
        ];
        priority = 9;
      };

      prettypst-default = {
        command = "${pkgs.prettypst}/bin/prettypst";
        includes = ["*.typ"];
        no-positional-arg-support = true;
        options = [
          "-s"
          "default"
        ];
        priority = 2;
      };

      prettypst-otbs = {
        command = "${pkgs.prettypst}/bin/prettypst";
        includes = ["*.typ"];
        no-positional-arg-support = true;
        options = [
          "-s"
          "otbs"
        ];
        priority = 3;
      };

      sort-markdown-tables = {
        command = "smt";
        includes = ["*.md"];
        priority = 2;
        options = ["-i"];
      };

      tombi-format = {
        command = "${pkgs.tombi}/bin/tombi";
        includes = ["*.toml"];
        options = [
          "format"
          "--offline"
        ];
        priority = 11;
      };

      yamlfix = {
        command = "${pkgs.yamlfix}/bin/yamlfix";
        includes = [
          # keep-sorted start
          "*.yaml"
          "*.yml"
          # keep-sorted end
        ];
        priority = 8;
      };

      yq-key-sort = {
        command = "${pkgs.yq-go}/bin/yq";
        options = [
          "-i"
          "-P"
          "sort_keys(..)"
        ];
        no-positional-arg-support = true;
        includes = [
          # keep-sorted start
          "*.json"
          "*.yaml"
          "*.yml"
          # keep-sorted end
        ];
        priority = 0;
      };
    };
  };
}
