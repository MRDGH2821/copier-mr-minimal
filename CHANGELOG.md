# Changelog

All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

---

## [0.14.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.13.0..v0.14.0) - 2026-03-31

### Bug Fixes

- skip skills-lock.json if agents is not used - ([f7ca86f](https://github.com/MRDGH2821/copier-mr-minimal/commit/f7ca86f37418bcc6c6c394752a8c50a8c3d05b9f)) - MRDGH2821

### Features

- **(treefmt)** format jsonc - ([d942a87](https://github.com/MRDGH2821/copier-mr-minimal/commit/d942a873abad20b8cc8a2ee2534bc0c870746588)) - MRDGH2821
- remove 2 skills - ([b279c37](https://github.com/MRDGH2821/copier-mr-minimal/commit/b279c37b8f8afe84ac3ef3f58e0145d645bc501a)) - MRDGH2821

---

## [0.13.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.12.1..v0.13.0) - 2026-03-25

### Features

- **(treefmt)** use smt to sort markdown tables - ([113080b](https://github.com/MRDGH2821/copier-mr-minimal/commit/113080b6171e404f36a0d9d61cb81c09015201e0)) - MRDGH2821

---

## [0.12.1](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.12.0..v0.12.1) - 2026-03-18

### Bug Fixes

- **(copier)** convert template into regular file - ([4f1c53b](https://github.com/MRDGH2821/copier-mr-minimal/commit/4f1c53b5c77823b3536dff87a8dc88b40c26388e)) - MRDGH2821
- **(copier)** fix command name - ([9d78970](https://github.com/MRDGH2821/copier-mr-minimal/commit/9d7897076cf5a4f295180836edb50730453bffef)) - MRDGH2821
- enforce HTTPS-only for git_repo_url validator - ([a558b47](https://github.com/MRDGH2821/copier-mr-minimal/commit/a558b476b1e7955d76dcebb09c0402f2e451327b)) - MRDGH2821
- modify post-generation tasks to check tool availability only - ([79ff7df](https://github.com/MRDGH2821/copier-mr-minimal/commit/79ff7df5ed91cc047dd6c494062ef1acdff87492)) - MRDGH2821

### Miscellaneous Chores

- **(copier)** modify the outputs - ([fbbc380](https://github.com/MRDGH2821/copier-mr-minimal/commit/fbbc380a4cd893ea2fa71d1f2ca385dcb482bab2)) - MRDGH2821
- **(megalinter)** add schema link - ([f2680e9](https://github.com/MRDGH2821/copier-mr-minimal/commit/f2680e9476675d3c1de7bca4e02194451a9245d7)) - MRDGH2821

---

## [0.12.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.11.0..v0.12.0) - 2026-03-17

### Bug Fixes

- remove redundancies from AGENTS.md files - ([aaeccf2](https://github.com/MRDGH2821/copier-mr-minimal/commit/aaeccf2f2dff263c2869580c7358951e07001416)) - MRDGH2821

### Documentation

- remove Project Skills table from AGENTS.md files - ([175f4de](https://github.com/MRDGH2821/copier-mr-minimal/commit/175f4de0e9476a2cee363c70bb6dbc7c48e84690)) - MRDGH2821

### Features

- add skills in template - ([5e113fa](https://github.com/MRDGH2821/copier-mr-minimal/commit/5e113fa9f08bdd012f8634a6721d732b02542ed6)) - MRDGH2821

### Ci

- **(megalinter)** disable devskim - ([c5df380](https://github.com/MRDGH2821/copier-mr-minimal/commit/c5df3801ab33e984155ecfa3db3120379f8905e8)) - MRDGH2821

---

## [0.11.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.10.0..v0.11.0) - 2026-03-16

### Bug Fixes

- **(cocogitto)** fix changelog generation - ([3a21099](https://github.com/MRDGH2821/copier-mr-minimal/commit/3a2109936960acf95eea1a8f2d26a37228d77d1e)) - MRDGH2821
- **(megalinter)** install prettier plugin - ([de1d09e](https://github.com/MRDGH2821/copier-mr-minimal/commit/de1d09e0687ad126126f35ff33079a8c9df88866)) - MRDGH2821
- make files executable - ([de2d51d](https://github.com/MRDGH2821/copier-mr-minimal/commit/de2d51d939efc08079759fdc55ccccab043ac02c)) - MRDGH2821
- fix linter errors - ([c9e6c3a](https://github.com/MRDGH2821/copier-mr-minimal/commit/c9e6c3a569388c7540712706a38dd1323df881dd)) - MRDGH2821

### Documentation

- **(cocogitto)** correct cocogitto skill: cog commit supports multiline MESSAGE for trailers - ([5dfffb5](https://github.com/MRDGH2821/copier-mr-minimal/commit/5dfffb5faea05a72a441ad8230638fe4ba3c849f)) - MRDGH2821
- **(cocogitto)** document --edit flag limitation in cocogitto skill - ([0a9ac68](https://github.com/MRDGH2821/copier-mr-minimal/commit/0a9ac68c70612610fa912f5bb7a46e31d6b94fc7)) - MRDGH2821
- **(pre-commit)** remove treefmt hook, add manual treefmt -vv instruction - ([e0d38c6](https://github.com/MRDGH2821/copier-mr-minimal/commit/e0d38c60f3b182d2ef583441a8ad8b1dbcfc4a36)) - MRDGH2821
- overhaul template AGENTS.md with mandatory action logging - ([1ca6d00](https://github.com/MRDGH2821/copier-mr-minimal/commit/1ca6d0035bda40a74b49b8b6d890fd6d5895407a)) - MRDGH2821
- add mandatory AI Co-authored-by trailer rule to commit guidelines - ([cc0d977](https://github.com/MRDGH2821/copier-mr-minimal/commit/cc0d977f72efeb6626164f422c1ae1295586c54a)) - MRDGH2821
- add git-commit skill, replace Prettier with treefmt, add Project Skills table to template - ([0439ca1](https://github.com/MRDGH2821/copier-mr-minimal/commit/0439ca1d69e475f4fc418cbd579a310f8dad9c35)) - MRDGH2821
- remove manual prek run instructions, hooks run automatically on commit - ([e3d11b4](https://github.com/MRDGH2821/copier-mr-minimal/commit/e3d11b4061b7cb74228f644092b8071ce5708d8a)) - MRDGH2821
- point commit scope reference to cog.toml instead of pre-commit config - ([bdff5aa](https://github.com/MRDGH2821/copier-mr-minimal/commit/bdff5aa82d3c20fc1e2e006d735e126e834f4ff6)) - MRDGH2821

### Features

- **(cocogitto)** add cocogitto skill for conventional commits via cog CLI - ([00e0000](https://github.com/MRDGH2821/copier-mr-minimal/commit/00e0000739b8cb5eddf319422a0fe82e573d6316)) - MRDGH2821
- **(copier)** ask for git repo url - ([ee4ac6b](https://github.com/MRDGH2821/copier-mr-minimal/commit/ee4ac6b3e3ae4ac787c0ad6bd760be326283e129)) - MRDGH2821
- add tool-runner skill for intelligent runtime selection - ([9228559](https://github.com/MRDGH2821/copier-mr-minimal/commit/92285593c16ff06bf00c42972ead42990e879206)) - MRDGH2821
- add agent skills - ([81f8454](https://github.com/MRDGH2821/copier-mr-minimal/commit/81f84547cdfe71df29167b31db66728dc7e40cd4)) - MRDGH2821

### Miscellaneous Chores

- **(cspell)** update word list - ([51695fe](https://github.com/MRDGH2821/copier-mr-minimal/commit/51695fec3cb330b496000debbe212d551239d82c)) - MRDGH2821
- **(pre-commit)** update hooks - ([db197da](https://github.com/MRDGH2821/copier-mr-minimal/commit/db197da43fa2463e8958d91961ef09b04bf9cef9)) - MRDGH2821
- add find-skills skill - ([d353160](https://github.com/MRDGH2821/copier-mr-minimal/commit/d353160f7f6828494adeb64587215c8379c345c4)) - MRDGH2821
- delete agents_global as no longer needed - ([a64d409](https://github.com/MRDGH2821/copier-mr-minimal/commit/a64d409ca1e174141aed5db8234b931243eb016b)) - MRDGH2821
- add .lycheeignore - ([fcf2e53](https://github.com/MRDGH2821/copier-mr-minimal/commit/fcf2e538a0cfd4efa8ea7723665830768980af57)) - MRDGH2821

### Refactoring

- **(treefmt)** use glob matching - ([00c8019](https://github.com/MRDGH2821/copier-mr-minimal/commit/00c80196e981c402e8d59daf90d3ac004c38dd1c)) - MRDGH2821
- use .agents folder instead - ([b9eb7fe](https://github.com/MRDGH2821/copier-mr-minimal/commit/b9eb7fe470e3e2eb9d986c960c67959fab34c669)) - MRDGH2821
- convert to template - ([1ec7307](https://github.com/MRDGH2821/copier-mr-minimal/commit/1ec73076777d721857820724b1f974c79bedce11)) - MRDGH2821

### Style

- format files - ([52f387a](https://github.com/MRDGH2821/copier-mr-minimal/commit/52f387aefd7e3e3b446d9823cbef4602e8c7b5cf)) - MRDGH2821

---

## [0.10.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.9.1..v0.10.0) - 2026-03-16

### Features

- **(treefmt)** add formatter for ignore files - ([de11990](https://github.com/MRDGH2821/copier-mr-minimal/commit/de11990917a1e5f7adebb7397203a16cecb3ce13)) - MRDGH2821

---

## [0.9.1](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.9.0..v0.9.1) - 2026-03-16

### Bug Fixes

- **(treefmt)** use glob patterns to match all possible cspell config fields - ([d5c223c](https://github.com/MRDGH2821/copier-mr-minimal/commit/d5c223c84fb42a91c6ce93a0ca75f33093be683e)) - MRDGH2821

### Miscellaneous Chores

- **(cspell)** update words - ([fa05d6a](https://github.com/MRDGH2821/copier-mr-minimal/commit/fa05d6a1e3706931f4e2e0f780be758b628f7468)) - MRDGH2821

---

## [0.9.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.8.1..v0.9.0) - 2026-03-10

### Features

- **(treefmt)** add typstyle formatter - ([ec6b682](https://github.com/MRDGH2821/copier-mr-minimal/commit/ec6b68288f55e7507b680630b0d64fb01bf80b59)) - MRDGH2821

---

## [0.8.1](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.8.0..v0.8.1) - 2026-03-10

### Bug Fixes

- **(treefmt)** allow missing formatters - ([466c1b4](https://github.com/MRDGH2821/copier-mr-minimal/commit/466c1b48ae44e55f69b27c66e4e5da9dbd075a8a)) - MRDGH2821

---

## [0.8.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.7.1..v0.8.0) - 2026-03-09

### Features

- add treefmt-nix integration - ([d452d4f](https://github.com/MRDGH2821/copier-mr-minimal/commit/d452d4f4b01b4325e0fc6b4b787404ae8128945f)) - MRDGH2821
- add questions & flake.nix - ([85fceef](https://github.com/MRDGH2821/copier-mr-minimal/commit/85fceef1b9f363db3590ced0d837bddec0b1f15c)) - MRDGH2821

### Miscellaneous Chores

- **(treefmt)** add nixfmt - ([c4f1685](https://github.com/MRDGH2821/copier-mr-minimal/commit/c4f16856f42f1be2b155f4d361240bf21f403861)) - MRDGH2821
- add flake.nix - ([9da6ba5](https://github.com/MRDGH2821/copier-mr-minimal/commit/9da6ba522e574dacc2ce41ecff8e5369989d98f5)) - MRDGH2821
- ignore .direnv - ([ba44fea](https://github.com/MRDGH2821/copier-mr-minimal/commit/ba44fea5dbc26da0ca9950e27c115a619efb42d8)) - MRDGH2821
- remove treefmt-nix - ([4d16bd0](https://github.com/MRDGH2821/copier-mr-minimal/commit/4d16bd0f1382a4335a428ee4fc91c19593602b9d)) - MRDGH2821
- add shebang - ([0a0d20c](https://github.com/MRDGH2821/copier-mr-minimal/commit/0a0d20c1b922fa6503e72fd3ecd35cea1950420c)) - MRDGH2821

### Style

- format file - ([b455f56](https://github.com/MRDGH2821/copier-mr-minimal/commit/b455f5609568fc01ae348a9df5090b7b75c8f6a1)) - MRDGH2821

---

## [0.7.1](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.7.0..v0.7.1) - 2026-03-05

### Bug Fixes

- **(cocogitto)** migrate config - ([0943af9](https://github.com/MRDGH2821/copier-mr-minimal/commit/0943af948ed09eceb0692cbe6e4aa0fd5e459122)) - MRDGH2821

---

## [0.7.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.6.0..v0.7.0) - 2026-02-27

### Features

- **(treefmt)** add schema link - ([78da12e](https://github.com/MRDGH2821/copier-mr-minimal/commit/78da12e397f8c4ea227f163ec17ce8b3def98569)) - MRDGH2821

---

## [0.6.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.5.0..v0.6.0) - 2026-02-24

### Features

- **(treefmt)** add new formatter - ([fcaf442](https://github.com/MRDGH2821/copier-mr-minimal/commit/fcaf4420ebeeb4355d74548407cf5dd3fe2a6850)) - MRDGH2821
- change syntax of formatters - ([cc4a433](https://github.com/MRDGH2821/copier-mr-minimal/commit/cc4a433a50499a24a04b6c8ba4f5762fdb38a8fc)) - MRDGH2821

---

## [0.5.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.4.0..v0.5.0) - 2026-02-20

### Bug Fixes

- fix linter errors - ([f59d94e](https://github.com/MRDGH2821/copier-mr-minimal/commit/f59d94e262d18b4a54d30301f63e6c524dba5445)) - MRDGH2821

### Features

- add gitlab ci - ([1b360a6](https://github.com/MRDGH2821/copier-mr-minimal/commit/1b360a688d80f5d18ec1a967abf08c91da44a75c)) - MRDGH2821
- add question for ci - ([6f395a3](https://github.com/MRDGH2821/copier-mr-minimal/commit/6f395a3e0ce581ca2f58b46a2828e4489cfbd5f7)) - MRDGH2821

### Refactoring

- **(copier)** conditionally exclude files via config - ([50cd43c](https://github.com/MRDGH2821/copier-mr-minimal/commit/50cd43c0fb1078fd4c76940be2f6c44b679eeec7)) - MRDGH2821
- reorder hooks & add tombi array sorting directives - ([e5c0ba1](https://github.com/MRDGH2821/copier-mr-minimal/commit/e5c0ba12ad4cd603314abf455850de5a8eeb64da)) - MRDGH2821

### Style

- format file - ([760cdb9](https://github.com/MRDGH2821/copier-mr-minimal/commit/760cdb9bdf1d7d526272ffa963166663bbfff021)) - MRDGH2821

### Ci

- **(megalinter)** add pre run commands - ([35fb6d3](https://github.com/MRDGH2821/copier-mr-minimal/commit/35fb6d3546f53edb75bccf32ce9d24591e4c3b94)) - MRDGH2821

---

## [0.4.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.3.0..v0.4.0) - 2026-02-15

### Features

- add treefmt & yamlfix config - ([ebe81d4](https://github.com/MRDGH2821/copier-mr-minimal/commit/ebe81d402f20d51d7c3b2507611c206b0cc8de4a)) - MRDGH2821

### Miscellaneous Chores

- **(prettier)** remove unneeded plugin - ([21abb39](https://github.com/MRDGH2821/copier-mr-minimal/commit/21abb39764106ee3283028a8d0be72ca7608de21)) - MRDGH2821

### Style

- format files - ([63cf11a](https://github.com/MRDGH2821/copier-mr-minimal/commit/63cf11adc8ab9ac3a964945d886554a26d8f07aa)) - MRDGH2821

---

## [0.3.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.2.0..v0.3.0) - 2026-02-07

### Features

- **(cocogitto)** update scopes - ([858a4cd](https://github.com/MRDGH2821/copier-mr-minimal/commit/858a4cd8876e240153d463878833ae872cda540c)) - MRDGH2821
- **(cocogitto)** use git-cliff to generate changelogs - ([b5a98ee](https://github.com/MRDGH2821/copier-mr-minimal/commit/b5a98eeb64876719c960ffaea1d8738d4255bad5)) - MRDGH2821
- **(prettier)** disable trailing commas - ([2f9997b](https://github.com/MRDGH2821/copier-mr-minimal/commit/2f9997bfe67e752a7916e26fddc1a0e0af841372)) - MRDGH2821

### Miscellaneous Chores

- **(cspell)** update word list - ([dde1b5a](https://github.com/MRDGH2821/copier-mr-minimal/commit/dde1b5a61ebe25d2806c81eeb77ee1a1b0c71229)) - MRDGH2821

### Build

- convert prettier & plugins to dev deps - ([20ccb78](https://github.com/MRDGH2821/copier-mr-minimal/commit/20ccb782db6ab5ddeffe2b208dd989c1402fa34f)) - MRDGH2821

---

## [0.2.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.1.0..v0.2.0) - 2026-02-04

### Bug Fixes

- **(cocogitto)** use tag with `v` prefix - ([735a28b](https://github.com/MRDGH2821/copier-mr-minimal/commit/735a28b2cb7415d3206678e69276f30bb261cca5)) - MRDGH2821

### Features

- **(prettier)** add ignore file - ([7b0441c](https://github.com/MRDGH2821/copier-mr-minimal/commit/7b0441c770526a7658b8e7ea5f1a368bf956cc31)) - MRDGH2821

### Miscellaneous Chores

- add prettier plugin & workspaces - ([2488b39](https://github.com/MRDGH2821/copier-mr-minimal/commit/2488b3987cc74759a424f3c4620d9d1d82ab17d5)) - MRDGH2821
- add detailed changelog - ([434c82c](https://github.com/MRDGH2821/copier-mr-minimal/commit/434c82c83f9441b134b082be23364ec05fb6f7e6)) - MRDGH2821

---

## [0.1.0](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.18..v0.1.0) - 2026-02-04

### Bug Fixes

- **(prettier)** add toml plugin - ([da63044](https://github.com/MRDGH2821/copier-mr-minimal/commit/da630441b4c00cfd6f789d69470196863222244c)) - MRDGH2821

### Features

- **(cocogitto)** update config in template - ([99aa546](https://github.com/MRDGH2821/copier-mr-minimal/commit/99aa546aca999e664d3f3aaf0b51ba0e4576f716)) - MRDGH2821
- **(cocogitto)** add pre cump hooks - ([a3ebbed](https://github.com/MRDGH2821/copier-mr-minimal/commit/a3ebbeda50a40fd552bf7ad816f507d69a536922)) - MRDGH2821
- **(cocogitto)** update scopes - ([3b68854](https://github.com/MRDGH2821/copier-mr-minimal/commit/3b68854632ae1e7eb24399e4762884461af18910)) - MRDGH2821

### Miscellaneous Chores

- **(cocogitto)** update config - ([53f5717](https://github.com/MRDGH2821/copier-mr-minimal/commit/53f57179e6b87ba704dc18b6bf1e1def8bb69d3e)) - MRDGH2821
- **(cocogitto)** update config template - ([79e936e](https://github.com/MRDGH2821/copier-mr-minimal/commit/79e936eaf9d80b3f4d65ba351bf222cdef7066e9)) - MRDGH2821

---

## [0.0.18](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.17..v0.0.18) - 2026-02-03

### Bug Fixes

- **(copier)** fix syntax - ([8272402](https://github.com/MRDGH2821/copier-mr-minimal/commit/8272402e35d7c1297315dd2c1be38729a5106de1)) - MRDGH2821

### Features

- **(pre-commit)** update hooks - ([b8396db](https://github.com/MRDGH2821/copier-mr-minimal/commit/b8396db6401f1ecb9b24c1ea2315efc3c540b8a5)) - MRDGH2821

### Miscellaneous Chores

- **(cocogitto)** add config - ([a1d081b](https://github.com/MRDGH2821/copier-mr-minimal/commit/a1d081bbcbda469ea576febd40999f3039810760)) - MRDGH2821
- **(cspell)** update words - ([87e6ce9](https://github.com/MRDGH2821/copier-mr-minimal/commit/87e6ce9ec8121c313c9f1f9a8ccdb9ed22420ad8)) - MRDGH2821
- ignore modules dir - ([eac5cd7](https://github.com/MRDGH2821/copier-mr-minimal/commit/eac5cd74d8dde0e94a52109562ebe95ef01d518b)) - MRDGH2821
- add prettier plugin - ([0019198](https://github.com/MRDGH2821/copier-mr-minimal/commit/0019198348f8164e3906611af57ff4cd81a6de60)) - MRDGH2821

### Style

- sort properties - ([832f0ca](https://github.com/MRDGH2821/copier-mr-minimal/commit/832f0ca806e17b20cbc1937ec2ec0cf480148d0d)) - MRDGH2821

---

## [0.0.17](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.16..v0.0.17) - 2026-01-14

### Miscellaneous Chores

- **(jscpd)** update ignore list - ([df564e0](https://github.com/MRDGH2821/copier-mr-minimal/commit/df564e0f43237208a2b50f0939138e65e3252a18)) - MRDGH2821

### Refactoring

- segregate global agents setting from project specific ones - ([5f016a0](https://github.com/MRDGH2821/copier-mr-minimal/commit/5f016a0cc000a92700c5a8736a76c15d732ac2ab)) - MRDGH2821

---

## [0.0.16](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.15..v0.0.16) - 2026-01-13

### Miscellaneous Chores

- **(copier)** add .github folder in template - ([9ed081b](https://github.com/MRDGH2821/copier-mr-minimal/commit/9ed081b7cbd3a272040f2967b639da4cf801cb98)) - MRDGH2821

---

## [0.0.15](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.14..v0.0.15) - 2026-01-13

### Miscellaneous Chores

- **(copier)** add markdown lint config - ([949c2fe](https://github.com/MRDGH2821/copier-mr-minimal/commit/949c2fe975a91c40b18b50cb228cc62923ed80cd)) - MRDGH2821
- ignore cspell file in duplicates - ([c2715f6](https://github.com/MRDGH2821/copier-mr-minimal/commit/c2715f6b4aab2a4e7b323f0676968348291fba59)) - MRDGH2821

### Refactoring

- **(pre-commit)** rename pre-commit config file - ([742090c](https://github.com/MRDGH2821/copier-mr-minimal/commit/742090ced756b8c3077b9f0492e09156b5f18aab)) - MRDGH2821

---

## [0.0.14](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.13..v0.0.14) - 2026-01-13

### Documentation

- update agents.md to document every interaction - ([d3f30a9](https://github.com/MRDGH2821/copier-mr-minimal/commit/d3f30a985adaed7584ab9751bc2fa83dda9788c6)) - MRDGH2821

### Features

- **(copier)** add a question to use AGENTS.md file - ([df64e0f](https://github.com/MRDGH2821/copier-mr-minimal/commit/df64e0f614cf31b1d795d2eab663b08c4ea4bbca)) - MRDGH2821

### Miscellaneous Chores

- **(copier)** install prek hooks - ([d2178c0](https://github.com/MRDGH2821/copier-mr-minimal/commit/d2178c020f6374f3ad1fb1bdfc6d86c918a579e0)) - MRDGH2821
- add markdownlint config - ([6ccaf49](https://github.com/MRDGH2821/copier-mr-minimal/commit/6ccaf4953a2792f771be7f089b40ad5de8a44a81)) - MRDGH2821

### Refactoring

- **(copier)** use a subdirectory for templates - ([18c97d1](https://github.com/MRDGH2821/copier-mr-minimal/commit/18c97d1d9b652a847cf7a74c1cc7f848a80600fa)) - MRDGH2821

### Style

- fix linter warnings - ([ed7f889](https://github.com/MRDGH2821/copier-mr-minimal/commit/ed7f889b3e65018a17cd2359952870524e45b065)) - MRDGH2821

---

## [0.0.13](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.12..v0.0.13) - 2026-01-13

### Documentation

- add AGENTS.md - ([c68da40](https://github.com/MRDGH2821/copier-mr-minimal/commit/c68da4097fef7092a9c82a6bfae425613336b5e4)) - MRDGH2821

### Miscellaneous Chores

- **(pre-commit)** remove redundant hook type to be installed by default - ([ff65fe5](https://github.com/MRDGH2821/copier-mr-minimal/commit/ff65fe5369c32d4c5fd722e76b6adda6a671e1bf)) - MRDGH2821

---

## [0.0.12](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.11..v0.0.12) - 2026-01-13

### Miscellaneous Chores

- remove megalinter pre-commit hook & question - ([e5b19c3](https://github.com/MRDGH2821/copier-mr-minimal/commit/e5b19c3e1f064b1ff62231b4f5e8278de2013152)) - MRDGH2821

---

## [0.0.11](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.10..v0.0.11) - 2026-01-12

### Miscellaneous Chores

- **(copier)** exclude megalinter reports folder - ([4a13230](https://github.com/MRDGH2821/copier-mr-minimal/commit/4a132307b246183f31d992d8df7783c2689e950b)) - MRDGH2821
- **(copier)** use default answers file name - ([48b88fe](https://github.com/MRDGH2821/copier-mr-minimal/commit/48b88fe98e5a4c8f6df5c54782b18bcc7a807e80)) - MRDGH2821

### Style

- **(pre-commit)** split description in multiple lines - ([2fc0690](https://github.com/MRDGH2821/copier-mr-minimal/commit/2fc06907358db5580b04cd2d0cb333a12fb00c26)) - MRDGH2821
- sort lines - ([f27e35c](https://github.com/MRDGH2821/copier-mr-minimal/commit/f27e35cde58d0d451e68ad4b6c8a4f4b3381a429)) - MRDGH2821

---

## [0.0.10](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.9..v0.0.10) - 2026-01-12

### Bug Fixes

- **(pre-commit)** provide cspell config as arg - ([bfb2110](https://github.com/MRDGH2821/copier-mr-minimal/commit/bfb21107aee765a7bbfcde03f9a4945c06ac0042)) - MRDGH2821

---

## [0.0.9](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.8..v0.0.9) - 2026-01-12

### Bug Fixes

- **(pre-commit)** use correct args syntax - ([3b17938](https://github.com/MRDGH2821/copier-mr-minimal/commit/3b179384714a6d14d3373ff5c0c96cc5d9bc7913)) - MRDGH2821

---

## [0.0.8](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.7..v0.0.8) - 2026-01-12

### Bug Fixes

- **(copier)** add answers file template - ([f5f7a1c](https://github.com/MRDGH2821/copier-mr-minimal/commit/f5f7a1c40532cd7b03796a5217194a039bac5f50)) - MRDGH2821

### Refactoring

- convert ignore file into template - ([4df4e7d](https://github.com/MRDGH2821/copier-mr-minimal/commit/4df4e7de16e322b056046ce598b0bb8330d61318)) - MRDGH2821

---

## [0.0.7](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.6..v0.0.7) - 2026-01-12

### Miscellaneous Chores

- **(cspell)** update word list - ([e4f2af5](https://github.com/MRDGH2821/copier-mr-minimal/commit/e4f2af5c302dae5a5dcd97e6294208ea4298d5da)) - MRDGH2821
- **(megalinter)** update config - ([b0cc332](https://github.com/MRDGH2821/copier-mr-minimal/commit/b0cc332ddf563162428f9d91d67d637048fbd374)) - MRDGH2821
- add ignore config - ([6ce4548](https://github.com/MRDGH2821/copier-mr-minimal/commit/6ce45480d905416b5c56d4f4bc17f70dee23e8f6)) - MRDGH2821

---

## [0.0.6](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.5..v0.0.6) - 2026-01-12

### Bug Fixes

- **(pre-commit)** fix hook stage - ([8d36eaa](https://github.com/MRDGH2821/copier-mr-minimal/commit/8d36eaa782c46a99f9feed20fe65c804c6cd90d6)) - MRDGH2821

### Miscellaneous Chores

- **(copier)** add answers file path - ([a92bc46](https://github.com/MRDGH2821/copier-mr-minimal/commit/a92bc46f6e294e545104c2bd541e73a0857437ba)) - MRDGH2821
- **(pre-commit)** remove megalinter commit hook - ([9e00516](https://github.com/MRDGH2821/copier-mr-minimal/commit/9e005164de6bf6ce016c1260ce9fd879dd00c571)) - MRDGH2821

---

## [0.0.5](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.4..v0.0.5) - 2026-01-12

### Miscellaneous Chores

- add prettier config - ([1b4df33](https://github.com/MRDGH2821/copier-mr-minimal/commit/1b4df3353e0c5466fd0f6c172d2e8a19d55d0eb0)) - MRDGH2821

---

## [0.0.4](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.3..v0.0.4) - 2026-01-11

### Miscellaneous Chores

- **(cspell)** update wordlist - ([8d64422](https://github.com/MRDGH2821/copier-mr-minimal/commit/8d644223fcf09f0a07c37870ec0ec8ab91b5cc4d)) - MRDGH2821
- **(github)** add funding.yaml - ([a3a21be](https://github.com/MRDGH2821/copier-mr-minimal/commit/a3a21bed0b4d70e542419fdaf9752bfb1146d7be)) - MRDGH2821

---

## [0.0.3](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.2..v0.0.3) - 2026-01-11

### Bug Fixes

- **(copier)** use different file name for pre-commit config - ([d957fab](https://github.com/MRDGH2821/copier-mr-minimal/commit/d957fabc1df77495673015f3e2bcd49dec70e815)) - MRDGH2821

---

## [0.0.2](https://github.com/MRDGH2821/copier-mr-minimal/compare/v0.0.1..v0.0.2) - 2026-01-11

### Bug Fixes

- **(copier)** fix question - ([75de931](https://github.com/MRDGH2821/copier-mr-minimal/commit/75de9315ee81988d908cf330254bc67050d83eaa)) - MRDGH2821

### Miscellaneous Chores

- **(copier)** add post generation task - ([68387db](https://github.com/MRDGH2821/copier-mr-minimal/commit/68387dbe1bcf5ea497786279a22b3e8210e6940d)) - MRDGH2821
- **(cspell)** update words - ([8a6044d](https://github.com/MRDGH2821/copier-mr-minimal/commit/8a6044d8b1a56a6f08b4fe30d91b27166339f5e0)) - MRDGH2821
- **(megalinter)** update config & remove comments - ([0797ad4](https://github.com/MRDGH2821/copier-mr-minimal/commit/0797ad4e77ef6c44ae057c333351829526a5ca60)) - MRDGH2821
- **(pre-commit)** add a new scope - ([9a36005](https://github.com/MRDGH2821/copier-mr-minimal/commit/9a360055320e3a8c59abe0824df859486030a0ff)) - MRDGH2821

### Ci

- **(megalinter)** set top level permissions to read-all - ([c35acea](https://github.com/MRDGH2821/copier-mr-minimal/commit/c35acea726b71fa1b656f3fef75453a439c76939)) - MRDGH2821

---

## [0.0.1] - 2026-01-11

### Miscellaneous Chores

- **(pre-commit)** update scopes - ([4182a06](https://github.com/MRDGH2821/copier-mr-minimal/commit/4182a0639dbfc427ca412f2dd6af23877f364c19)) - MRDGH2821
- inital commit - ([4c6c6eb](https://github.com/MRDGH2821/copier-mr-minimal/commit/4c6c6eb83760dc028e971492194b922af64d19b9)) - MRDGH2821

### Ci

- **(megalinter)** add config - ([61263c0](https://github.com/MRDGH2821/copier-mr-minimal/commit/61263c0f617c3c9293b97fd1abeb8b4c63d30aee)) - MRDGH2821

<!-- generated by git-cliff -->
