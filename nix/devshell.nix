{
  pkgs,
  inputs,
  ...
}: let
  pre-commit-check = import ./checks/pre-commit-check.nix {inherit inputs pkgs;};
in
  pkgs.mkShell {
    shellHook = ''
      ${pkgs.lib.getExe inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.apm} install
      ${pre-commit-check.shellHook}
    '';

    packages = with pkgs; [
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.antigravity-cli
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.apm
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.copilot-cli
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.cursor-agent
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.git-surgeon
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.rtk
      nil
      nixd
    ];
  }
