{
  pkgs,
  inputs,
  flake,
  system,
  ...
}: let
  mcpOpencodeConfig = import ./mcp.nix {inherit pkgs inputs;};
  skillsShellHook = import ./skills.nix {inherit pkgs inputs;};
  gitHooksCheck = flake.checks.${system}.pre-commit-check;
  inherit (gitHooksCheck) shellHook enabledPackages;
in
  pkgs.mkShell {
    shellHook = ''

      ln -sfn ${mcpOpencodeConfig} opencode.json
      mkdir -p .vscode

      ${shellHook}
      ${skillsShellHook}
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
