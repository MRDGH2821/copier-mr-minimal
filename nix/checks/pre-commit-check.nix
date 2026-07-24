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
        entry = "${pkgs.lib.getExe pkgs.cspell}";
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
      ripsecrets = {
        enable = true;
      };
      betterleaks = {
        enable = true;
        name = "betterleaks";
        entry = "${pkgs.lib.getExe pkgs.betterleaks}";
        stages = ["pre-commit"];
        args = [
          "git"
          "--pre-commit"
          "--redact"
          "--staged"
          "--verbose"
        ];
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
        entry = "${pkgs.lib.getExe pkgs.cocogitto}";
        args = [
          "verify"
          "--file"
        ];
        stages = ["commit-msg"];
      };
    };
  }
