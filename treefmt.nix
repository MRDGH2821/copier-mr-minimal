{ pkgs, ... }:
{
  projectRootFile = "flake.nix";

  settings = {
    "allow-missing-formatter" = true;

    formatter = {
    alejandra = {
      command = "${pkgs.alejandra}/bin/alejandra";
      includes = [ "*.nix" ];
      options = [ "-q" ];
      priority = 10;
    };

    cspell-sort = {
      command = "${pkgs.yq-go}/bin/yq";
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
      no-positional-arg-support = true;
      options = [
        "-i"
        ".words|= sort_by(downcase)|.ignorePaths|=sort_by(downcase)"
      ];
      priority = 9;
    };

    ignore-files-formatter = {
      command = "${pkgs.uv}/bin/uvx";
      includes = [
        "**/.*ignore"
        ".*ignore"
      ];
      options = [ "git+https://github.com/lorenzwalthert/gitignore-tidy" ];
      priority = 1;
    };

    nixfmt = {
      command = "${pkgs.nixfmt}/bin/nixfmt";
      includes = [ "*.nix" ];
      priority = 1;
    };

    prettier = {
      command = "${pkgs.bun}/bin/bunx";
      excludes = [
        "*.*ignore"
        "*.aac"
        "*.docx"
        "*.jinja"
        "*.jpg"
        "*.lock"
        "*.mp4"
        "*.nix"
        "*.pdf"
        "*.png"
        "*.pptx"
        "*.py"
        "*.txt"
        "*.typ"
        "LICENCE"
        "LICENSE"
        "justfile"
      ];
      includes = [ "*" ];
      options = [
        "prettier"
        "--log-level"
        "error"
        "--write"
      ];
      priority = 100;
    };

    prettypst-default = {
      command = "${pkgs.prettypst}/bin/prettypst";
      includes = [ "*.typ" ];
      no-positional-arg-support = true;
      options = [ "-s" "default" ];
      priority = 2;
    };

    prettypst-otbs = {
      command = "${pkgs.prettypst}/bin/prettypst";
      includes = [ "*.typ" ];
      no-positional-arg-support = true;
      options = [ "-s" "otbs" ];
      priority = 3;
    };

    ruff-format = {
      command = "${pkgs.uv}/bin/uvx";
      excludes = [ ];
      includes = [ "*.py" ];
      options = [ "ruff" "format" ];
      priority = 9;
    };

    ruff-lint = {
      command = "${pkgs.uv}/bin/uvx";
      excludes = [ ];
      includes = [ "*.py" ];
      options = [ "ruff" "check" "--fix" ];
      priority = 8;
    };

    sort-markdown-tables = {
      command = "smt";
      includes = [ "*.md" ];
      options = [ "-i" ];
      priority = 2;
    };

    sort-package-json = {
      command = "${pkgs.bun}/bin/bunx";
      includes = [ "package.json" ];
      options = [ "sort-package-json" ];
      priority = 10;
    };

    tombi-format = {
      command = "${pkgs.uv}/bin/uvx";
      includes = [ "*.toml" ];
      options = [ "tombi" "format" ];
      priority = 11;
    };

    toml-sort = {
      command = "${pkgs.uv}/bin/uvx";
      includes = [ "*.toml" ];
      options = [
        "toml-sort"
        "-i"
        "--sort-table-keys"
        "--sort-inline-tables"
      ];
      priority = 0;
    };

    typstyle = {
      command = "${pkgs.typstyle}/bin/typstyle";
      includes = [ "*.typ" ];
      options = [ "-i" ];
      priority = 1;
    };

    yamlfix = {
      command = "${pkgs.uv}/bin/uvx";
      includes = [
        "*.yaml"
        "*.yml"
      ];
      options = [ "yamlfix" ];
      priority = 8;
    };

    yq-key-sort = {
      command = "${pkgs.yq-go}/bin/yq";
      includes = [
        "*.json"
        "*.yaml"
        "*.yml"
      ];
      no-positional-arg-support = true;
      options = [
        "-i"
        "-P"
        "sort_keys(..)"
      ];
      priority = 0;
    };
  };
  };
}
