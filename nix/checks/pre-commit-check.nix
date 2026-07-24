{
  pkgs,
  inputs,
  ...
}: let
  treefmtEval = inputs.treefmt.lib.evalModule pkgs ../treefmt.nix;
in
  inputs.git-hooks.lib.${pkgs.stdenv.hostPlatform.system}.run {
    src = inputs.self;
    package = pkgs.prek;
    hooks = {
      treefmt = {
        enable = true;
        package = treefmtEval.config.build.wrapper;
      };
      check-merge-conflicts.enable = true;
      cspell = {
        enable = true;
        args = [
          "--config"
          ".cspell.json"
        ];
      };
      cspell-commit-msg = {
        enable = true;
        name = "Check commit message spelling";
        entry = "${pkgs.cspell}/bin/cspell";
        args = [
          "--config"
          ".cspell.json"
          "--no-must-find-files"
          "--no-progress"
          "--no-summary"
          "--files"
          ".git/COMMIT_EDITMSG"
        ];
        always_run = true;
        stages = ["commit-msg"];
      };
      ggshield = {
        enable = true;
        name = "ggshield";
        entry = "${pkgs.writeShellScriptBin "ggshield-hook" ''
          export PYTHONPATH="${pkgs.python313Packages.packaging}/${pkgs.python313.sitePackages}:$PYTHONPATH"
          exec ${pkgs.ggshield}/bin/ggshield secret scan pre-commit "$@"
        ''}/bin/ggshield-hook";
        stages = ["pre-commit"];
      };
      forbidden-files = {
        enable = true;
        name = "forbidden files";
        entry = "found Copier update rejection files; review and remove them before merging.";
        files = "\\.rej$";
        language = "fail";
      };
      cocogitto = {
        enable = true;
        name = "Cocogitto commits check";
        entry = "${pkgs.cocogitto}/bin/cog verify --file";
        stages = ["commit-msg"];
      };
    };
  }
