{
  pkgs,
  inputs,
  flake,
  ...
}: let
  formatter = import ./../formatter.nix {inherit pkgs inputs;};
in
  formatter.passthru.eval.config.build.check flake
