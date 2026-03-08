{
  pkgs,
  lib,
  ...
}: {
  # Used to find the project root
  projectRootFile = "flake.nix";

  # ── Native treefmt-nix program modules ──────────────────────────────────────

  # formatter.alejandra → programs.alejandra
  programs.alejandra = {
    enable = true;
    # -q (quiet) is the default behaviour of the nixpkgs alejandra package
  };

  # formatter.shfmt → programs.shfmt
  programs.shfmt = {
    enable = true;
    indent_size = 2; # matches --indent 2 in .treefmt.toml
  };

  # formatter.prettier → programs.prettier
  # bunx prettier --write is replaced by the nixpkgs prettier binary.
  # Include list mirrors .treefmt.toml; settings mirror .prettierrc.json.
  programs.prettier = {
    enable = true;
    includes = [
      "*.js"
      "*.json"
      "*.md"
      "*.toml"
      "*.ts"
      "*.yaml"
      "*.yml"
    ];
    settings = {
      tabWidth = 2;
      trailingComma = "none";
      useTabs = false;
      plugins = ["prettier-plugin-toml"];
      overrides = [
        {
          files = ["*.jsonc" "*.json"];
          options = {
            parser = "json";
            trailingComma = "none";
          };
        }
      ];
    };
  };

  # formatter.ruff-format → programs.ruff-format
  programs.ruff-format = {
    enable = true;
    # includes *.py by default
  };

  # formatter.ruff-lint → programs.ruff-check
  programs.ruff-check = {
    enable = true;
    # args: check --fix is the default in the module
  };

  # formatter.toml-sort → programs.toml-sort
  programs.toml-sort = {
    enable = true;
    # -i is already the default; enable --sort-table-keys via `all`
    all = true;
  };

  # formatter.xmllint → programs.xmllint
  programs.xmllint = {
    enable = true;
    # includes *.xml by default; module wraps in-place formatting correctly
  };

  # ── Custom formatter blocks (no native treefmt-nix module available) ────────

  settings.formatter = {
    # formatter.cspell-sort
    # Sorts .cspell.json words/ignorePaths arrays using yq
    cspell-sort = {
      command = "${pkgs.bash}/bin/bash";
      options = [
        "-c"
        ''
          for file in "$@"; do
            ${lib.getExe pkgs.yq-go} -i '.words |= sort_by(downcase) | .ignorePaths |= sort_by(downcase)' "$file"
          done
        ''
        "--"
      ];
      includes = [".cspell.json"];
      priority = 9;
    };

    # formatter.yq-key-sort
    # Sorts all keys in JSON/YAML files using yq
    yq-key-sort = {
      command = "${pkgs.bash}/bin/bash";
      options = [
        "-c"
        ''
          for file in "$@"; do
            ${lib.getExe pkgs.yq-go} -i -P 'sort_keys(..)' "$file"
          done
        ''
        "--"
      ];
      includes = [
        "*.json"
        "*.yaml"
        "*.yml"
      ];
      priority = 0;
    };

    # formatter.sort-markdown-tables
    sort-markdown-tables = {
      command = "${lib.getExe pkgs.bun}";
      options = [
        "x"
        "@fmma-npm/sort-markdown-tables"
        "-i"
      ];
      includes = ["*.md"];
      priority = 2;
    };

    # formatter.sort-package-json
    sort-package-json = {
      command = "${lib.getExe pkgs.bun}";
      options = [
        "x"
        "sort-package-json"
      ];
      includes = ["package.json"];
      priority = 10;
    };

    # formatter.prettypst-default
    prettypst-default = {
      command = "${lib.getExe pkgs.prettypst}";
      options = ["-s" "default"];
      includes = ["*.typ"];
      priority = 1;
    };

    # formatter.prettypst-otbs
    prettypst-otbs = {
      command = "${lib.getExe pkgs.prettypst}";
      options = ["-s" "otbs"];
      includes = ["*.typ"];
      priority = 2;
    };

    # formatter.tombi-format
    # tombi is a TOML formatter/linter available via uvx
    tombi-format = {
      command = "${lib.getExe pkgs.uv}";
      options = [
        "tool"
        "run"
        "tombi"
        "format"
      ];
      includes = ["*.toml"];
      priority = 11;
    };

    # formatter.yamlfix
    yamlfix = {
      command = "${lib.getExe pkgs.uv}";
      options = [
        "tool"
        "run"
        "yamlfix"
      ];
      includes = [
        "*.yaml"
        "*.yml"
      ];
      priority = 8;
    };
  };
}
