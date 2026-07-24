{
  pkgs,
  inputs,
  ...
}: let
  agentLib = inputs.agent-skills.lib.agent-skills;

  skillsSources = {
    awesome-copilot = {
      path = inputs.awesome-copilot;
      subdir = "skills";
    };
  };

  skillsCatalog = agentLib.discoverCatalog skillsSources;

  skillsSelection = agentLib.selectSkills {
    catalog = skillsCatalog;
    allowlist = ["git-commit"];
    sources = skillsSources;
  };

  skillsBundle = agentLib.mkBundle {
    inherit pkgs;
    selection = skillsSelection;
  };

  localSkillsTargets = {
    agents =
      agentLib.defaultLocalTargets.agents
      // {
        enable = true;
      };
    antigravity =
      agentLib.defaultLocalTargets.antigravity
      // {
        enable = true;
      };
    copilot =
      agentLib.defaultLocalTargets.copilot
      // {
        enable = true;
      };
    cursor =
      agentLib.defaultLocalTargets.cursor
      // {
        enable = true;
      };
    opencode =
      agentLib.defaultLocalTargets.opencode
      // {
        enable = true;
      };
  };
in
  agentLib.mkShellHook {
    inherit pkgs;
    bundle = skillsBundle;
    targets = localSkillsTargets;
  }
