{
  inputs,
  pkgs,
  ...
}: let
  pre-commit-check = import ./checks/pre-commit-check.nix {inherit inputs pkgs;};
in
  pkgs.mkShell {
    inherit (pre-commit-check) shellHook;
    packages = with pkgs; [
      inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}
      [
        antigravity-cli
        apm
        copilot-cli
        cursor-agent
        git-surgeon
        opencode
        rtk
      ]
      nil
      nixd
    ];
  }
