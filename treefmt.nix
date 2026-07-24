{pkgs, ...}: {
  projectRootFile = "flake.nix";

  programs = {
    actionlint.enable = true;
    alejandra.enable = true;
    beautysh.enable = true;
    deadnix.enable = true;
    djlint.enable = true;
    dockerfmt.enable = true;
    dockfmt.enable = true;
    dos2unix.enable = true;
    flake-edit.enable = true;
    genemichaels.enable = true;
    json-sort-cli.enable = true;
    just.enable = true;
    keep-sorted.enable = true;
    nbstripout.enable = true;
    nixf-diagnose.enable = true;
    nixfmt.enable = false;
    nixpkgs-fmt.enable = false;
    prettier.enable = true;
    ruff-check.enable = true;
    ruff-format.enable = true;
    shellcheck.enable = true;
    shfmt.enable = true;
    sqlfluff.enable = true;
    sqlfluff-lint.enable = true;
    statix.enable = true;
    taplo.enable = true;
    toml-sort.enable = true;
    typos = {
      enable = true;
      excludes = ["CHANGELOG.md"];
    };
    typstyle.enable = true;
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

    formatter = {
      cspell-sort = {
        command = "${
          pkgs.writeShellScriptBin "cspell-sort-wrapper" ''
            tmp=$(mktemp)
            ${pkgs.yq-go}/bin/yq '.words |= sort_by(downcase) | .ignorePaths |= sort_by(downcase)' "$1" > "$tmp" 2>/dev/null || exit 0
            if ! cmp -s "$1" "$tmp"; then
              mv "$tmp" "$1"
            else
              rm -f "$tmp"
            fi
          ''
        }/bin/cspell-sort-wrapper";
        includes = [
          "**/.CSpell*"
          "**/.cspell*"
          "**/cSpell*"
          "**/cspell*"
          ".CSpell*"
          ".cspell*"
          "cSpell*"
          "cspell*"
        ];
        priority = 9;
      };

      ignore-files-formatter = {
        command = "${pkgs.uv}/bin/uvx";
        includes = [
          "**/.*ignore"
          ".*ignore"
        ];
        options = ["git+https://github.com/lorenzwalthert/gitignore-tidy"];
        priority = 1;
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
        command = "${
          pkgs.writeShellScriptBin "smt-wrapper" ''
            if command -v smt >/dev/null 2>&1; then
              tmp=$(mktemp)
              cp "$1" "$tmp"
              smt -i "$tmp" 2>/dev/null || exit 0
              if ! cmp -s "$1" "$tmp"; then
                mv "$tmp" "$1"
              else
                rm -f "$tmp"
              fi
            fi
          ''
        }/bin/smt-wrapper";
        includes = ["*.md"];
        priority = 2;
      };

      sort-package-json = {
        command = "${pkgs.bun}/bin/bunx";
        includes = ["package.json"];
        options = ["sort-package-json"];
        priority = 10;
      };

      tombi-format = {
        command = "${pkgs.uv}/bin/uvx";
        includes = ["*.toml"];
        options = [
          "tombi"
          "format"
        ];
        priority = 11;
      };

      yamlfix = {
        command = "${pkgs.uv}/bin/uvx";
        includes = [
          "*.yaml"
          "*.yml"
        ];
        options = ["yamlfix"];
        priority = 8;
      };

      yq-key-sort = {
        command = "${
          pkgs.writeShellScriptBin "yq-key-sort-wrapper" ''
            tmp=$(mktemp)
            ${pkgs.yq-go}/bin/yq -P 'sort_keys(..)' "$1" > "$tmp" 2>/dev/null || exit 0
            if ! cmp -s "$1" "$tmp"; then
              mv "$tmp" "$1"
            else
              rm -f "$tmp"
            fi
          ''
        }/bin/yq-key-sort-wrapper";
        includes = [
          "*.json"
          "*.yaml"
          "*.yml"
        ];
        priority = 0;
      };
    };
  };
}
