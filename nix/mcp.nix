{
  pkgs,
  inputs,
  ...
}:
inputs.mcp-servers-nix.lib.mkConfig pkgs {
  flavor = "opencode";
  fileName = "opencode.json";
  programs = {
    filesystem = {
      enable = true;
      args = ["."];
    };
    nixos.enable = true;
  };
  settings."$schema" = "https://opencode.ai/config.json";
}
