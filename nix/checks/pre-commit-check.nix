{
  inputs,
  lib ? pkgs.lib,
  pkgs,
  ...
}:
inputs.git-hooks.lib.${pkgs.stdenv.hostPlatform.system}.run {
  hooks = {
    betterleaks = {
      args = [
        "--redact"
        "--verbose"
        "git"
        "--staged"
        "--pre-commit"
      ];
      enable = true;
      entry = "${lib.getExe pkgs.betterleaks}";
      name = "betterleaks";
      pass_filenames = false;
      stages = ["pre-commit"];
    };
    check-merge-conflicts.enable = true;
    cocogitto = {
      args = [
        "verify"
        "--file"
      ];
      enable = true;
      entry = "${lib.getExe pkgs.cocogitto}";
      name = "Cocogitto commits check";
      stages = ["commit-msg"];
    };
    cspell = {
      args = [
        "--config"
        ".cspell.json"
        "--no-must-find-files"
        "--no-progress"
        "--no-summary"
      ];
      enable = true;
    };
    cspell-commit-msg = {
      always_run = true;
      args = [
        "--config"
        ".cspell.json"
        "--no-must-find-files"
        "--no-progress"
        "--no-summary"
        ".git/COMMIT_EDITMSG"
      ];
      enable = true;
      entry = "${lib.getExe pkgs.cspell}";
      name = "Check commit message spelling";
      stages = ["commit-msg"];
    };
    forbidden-files = {
      enable = true;
      entry = "found Copier update rejection files; review and remove them before merging.";
      files = "\\.rej$";
      language = "fail";
      name = "forbidden files";
    };
    ls-lint = {
      enable = true;
      entry = "${lib.getExe pkgs.ls-lint}";
      name = "ls-lint";
      stages = ["pre-commit"];
    };
    ripsecrets.enable = true;
  };
  package = pkgs.prek;
  src = inputs.self;
}
