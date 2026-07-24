{
  pkgs,
  inputs,
  flake,
  system,
  ...
}: let
  gitHooksCheck = flake.checks.${system}.pre-commit-check;
  inherit (gitHooksCheck) shellHook enabledPackages;
in
  pkgs.mkShell {
    shellHook = ''
      ${pkgs.lib.getExe inputs.llm-agents.packages.${system}.apm} install
      ${shellHook}
    '';
    buildInputs = enabledPackages;
    packages = with pkgs; [
      inputs.llm-agents.packages.${system}.antigravity-cli
      inputs.llm-agents.packages.${system}.apm
      inputs.llm-agents.packages.${system}.copilot-cli
      inputs.llm-agents.packages.${system}.cursor-agent
      inputs.llm-agents.packages.${system}.git-surgeon
      inputs.llm-agents.packages.${system}.opencode
      inputs.llm-agents.packages.${system}.rtk
      nil
      nixd
    ];
  }
