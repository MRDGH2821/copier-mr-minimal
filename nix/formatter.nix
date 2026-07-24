{
  inputs,
  pkgs,
  ...
}: let
  treefmtEval = inputs.treefmt.lib.evalModule pkgs {
    imports = [
      ./treefmt.nix
      inputs.pedantix.treefmtModules.default
    ];
  };
in
  treefmtEval.config.build.wrapper
