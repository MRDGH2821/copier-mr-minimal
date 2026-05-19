# Changelog

All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

---

## [0.17.0](/compare/v0.0.18..v0.17.0) - 2026-05-19

### Bug Fixes

- **(cocogitto)** use tag with `v` prefix - ([735a28b](/commit/735a28b2cb7415d3206678e69276f30bb261cca5)) - MRDGH2821
- **(cocogitto)** migrate config - ([0943af9](/commit/0943af948ed09eceb0692cbe6e4aa0fd5e459122)) - MRDGH2821
- **(cocogitto)** fix changelog generation - ([3a21099](/commit/3a2109936960acf95eea1a8f2d26a37228d77d1e)) - MRDGH2821
- **(copier)** convert template into regular file - ([4f1c53b](/commit/4f1c53b5c77823b3536dff87a8dc88b40c26388e)) - MRDGH2821
- **(megalinter)** install prettier plugin - ([de1d09e](/commit/de1d09e0687ad126126f35ff33079a8c9df88866)) - MRDGH2821
- **(prettier)** add toml plugin - ([da63044](/commit/da630441b4c00cfd6f789d69470196863222244c)) - MRDGH2821
- **(treefmt)** allow missing formatters - ([466c1b4](/commit/466c1b48ae44e55f69b27c66e4e5da9dbd075a8a)) - MRDGH2821
- **(treefmt)** use glob patterns to match all possible cspell config fields - ([d5c223c](/commit/d5c223c84fb42a91c6ce93a0ca75f33093be683e)) - MRDGH2821
- **(treefmt)** fix syntax & options - ([39a2d95](/commit/39a2d95cc782397992217f62664d81cfafa785d1)) - MRDGH2821
- make files executable - ([de2d51d](/commit/de2d51d939efc08079759fdc55ccccab043ac02c)) - MRDGH2821
- remove redundancies from AGENTS.md files - ([aaeccf2](/commit/aaeccf2f2dff263c2869580c7358951e07001416)) - MRDGH2821
- ignore devenv & direnv dirs - ([354d66b](/commit/354d66bc53a5b87aebeb2f17cb384cc8aec499c0)) - MRDGH2821
- set no-positional-arg-support true for prettypst - ([ad974a6](/commit/ad974a608ceb20ac4dc0ceb806364a71a63dbbb8)) - MRDGH2821
- fix copier badge - ([a81978d](/commit/a81978d9201b91ea1959fefefb96deab1b8da7b2)) - MRDGH2821
- fix bracket - ([ff8c895](/commit/ff8c89592dd59efd746e38432ad83184d0a68a57)) - MRDGH2821

### Documentation

- **(pre-commit)** remove treefmt hook, add manual treefmt -vv instruction - ([e0d38c6](/commit/e0d38c60f3b182d2ef583441a8ad8b1dbcfc4a36)) - MRDGH2821
- overhaul template AGENTS.md with mandatory action logging - ([1ca6d00](/commit/1ca6d0035bda40a74b49b8b6d890fd6d5895407a)) - MRDGH2821
- add mandatory AI Co-authored-by trailer rule to commit guidelines - ([cc0d977](/commit/cc0d977f72efeb6626164f422c1ae1295586c54a)) - MRDGH2821
- add git-commit skill, replace Prettier with treefmt, add Project Skills table to template - ([0439ca1](/commit/0439ca1d69e475f4fc418cbd579a310f8dad9c35)) - MRDGH2821
- remove manual prek run instructions, hooks run automatically on commit - ([e3d11b4](/commit/e3d11b4061b7cb74228f644092b8071ce5708d8a)) - MRDGH2821
- point commit scope reference to cog.toml instead of pre-commit config - ([bdff5aa](/commit/bdff5aa82d3c20fc1e2e006d735e126e834f4ff6)) - MRDGH2821
- remove Project Skills table from AGENTS.md files - ([175f4de](/commit/175f4de0e9476a2cee363c70bb6dbc7c48e84690)) - MRDGH2821

### Features

- **(cocogitto)** update config in template - ([99aa546](/commit/99aa546aca999e664d3f3aaf0b51ba0e4576f716)) - MRDGH2821
- **(cocogitto)** add pre cump hooks - ([a3ebbed](/commit/a3ebbeda50a40fd552bf7ad816f507d69a536922)) - MRDGH2821
- **(cocogitto)** update scopes - ([3b68854](/commit/3b68854632ae1e7eb24399e4762884461af18910)) - MRDGH2821
- **(cocogitto)** update scopes - ([858a4cd](/commit/858a4cd8876e240153d463878833ae872cda540c)) - MRDGH2821
- **(cocogitto)** use git-cliff to generate changelogs - ([b5a98ee](/commit/b5a98eeb64876719c960ffaea1d8738d4255bad5)) - MRDGH2821
- **(cocogitto)** add cocogitto skill for conventional commits via cog CLI - ([00e0000](/commit/00e0000739b8cb5eddf319422a0fe82e573d6316)) - MRDGH2821
- **(prettier)** add ignore file - ([7b0441c](/commit/7b0441c770526a7658b8e7ea5f1a368bf956cc31)) - MRDGH2821
- **(prettier)** disable trailing commas - ([2f9997b](/commit/2f9997bfe67e752a7916e26fddc1a0e0af841372)) - MRDGH2821
- **(treefmt)** add new formatter - ([fcaf442](/commit/fcaf4420ebeeb4355d74548407cf5dd3fe2a6850)) - MRDGH2821
- **(treefmt)** add schema link - ([78da12e](/commit/78da12e397f8c4ea227f163ec17ce8b3def98569)) - MRDGH2821
- **(treefmt)** add typstyle formatter - ([ec6b682](/commit/ec6b68288f55e7507b680630b0d64fb01bf80b59)) - MRDGH2821
- **(treefmt)** add formatter for ignore files - ([de11990](/commit/de11990917a1e5f7adebb7397203a16cecb3ce13)) - MRDGH2821
- **(treefmt)** use smt to sort markdown tables - ([113080b](/commit/113080b6171e404f36a0d9d61cb81c09015201e0)) - MRDGH2821
- **(treefmt)** format jsonc - ([d942a87](/commit/d942a873abad20b8cc8a2ee2534bc0c870746588)) - MRDGH2821
- **(treefmt)** update schema and formatters - ([a103921](/commit/a103921036b27389956f2abaa2d9f7454a8f1835)) - MRDGH2821
- **(treefmt)** add more file types to format - ([450aa29](/commit/450aa29ff7bc3ebdd3c4f3f2c053abbf2c131352)) - MRDGH2821
- add treefmt & yamlfix config - ([ebe81d4](/commit/ebe81d402f20d51d7c3b2507611c206b0cc8de4a)) - MRDGH2821
- add gitlab ci - ([1b360a6](/commit/1b360a688d80f5d18ec1a967abf08c91da44a75c)) - MRDGH2821
- add question for ci - ([6f395a3](/commit/6f395a3e0ce581ca2f58b46a2828e4489cfbd5f7)) - MRDGH2821
- change syntax of formatters - ([cc4a433](/commit/cc4a433a50499a24a04b6c8ba4f5762fdb38a8fc)) - MRDGH2821
- add questions & flake.nix - ([85fceef](/commit/85fceef1b9f363db3590ced0d837bddec0b1f15c)) - MRDGH2821
- add agent skills - ([81f8454](/commit/81f84547cdfe71df29167b31db66728dc7e40cd4)) - MRDGH2821
- add skills in template - ([5e113fa](/commit/5e113fa9f08bdd012f8634a6721d732b02542ed6)) - MRDGH2821
- remove 2 skills - ([b279c37](/commit/b279c37b8f8afe84ac3ef3f58e0145d645bc501a)) - MRDGH2821
- update skills - ([6f5fb91](/commit/6f5fb919173bef09159283ef11c330f60c8c9789)) - MRDGH2821

### Miscellaneous Chores

- **(cspell)** update words - ([fa05d6a](/commit/fa05d6a1e3706931f4e2e0f780be758b628f7468)) - MRDGH2821
- **(cspell)** add words - ([c6817d6](/commit/c6817d6e15f8cf7f7dcf8abefef09925e9d7c9ee)) - MRDGH2821
- **(megalinter)** add schema link - ([f2680e9](/commit/f2680e9476675d3c1de7bca4e02194451a9245d7)) - MRDGH2821
- **(pre-commit)** update hooks - ([db197da](/commit/db197da43fa2463e8958d91961ef09b04bf9cef9)) - MRDGH2821
- delete agents_global as no longer needed - ([a64d409](/commit/a64d409ca1e174141aed5db8234b931243eb016b)) - MRDGH2821

### Refactoring

- **(copier)** conditionally exclude files via config - ([50cd43c](/commit/50cd43c0fb1078fd4c76940be2f6c44b679eeec7)) - MRDGH2821
- **(treefmt)** use glob matching - ([00c8019](/commit/00c80196e981c402e8d59daf90d3ac004c38dd1c)) - MRDGH2821
- reorder hooks & add tombi array sorting directives - ([e5c0ba1](/commit/e5c0ba12ad4cd603314abf455850de5a8eeb64da)) - MRDGH2821
- use .agents folder instead - ([b9eb7fe](/commit/b9eb7fe470e3e2eb9d986c960c67959fab34c669)) - MRDGH2821
- convert to template - ([1ec7307](/commit/1ec73076777d721857820724b1f974c79bedce11)) - MRDGH2821

### Style

- format files - ([63cf11a](/commit/63cf11adc8ab9ac3a964945d886554a26d8f07aa)) - MRDGH2821
- format file - ([760cdb9](/commit/760cdb9bdf1d7d526272ffa963166663bbfff021)) - MRDGH2821

### Ci

- **(megalinter)** disable devskim - ([c5df380](/commit/c5df3801ab33e984155ecfa3db3120379f8905e8)) - MRDGH2821

---

## [0.0.18](/compare/v0.0.17..v0.0.18) - 2026-02-03

### Features

- **(pre-commit)** update hooks - ([b8396db](/commit/b8396db6401f1ecb9b24c1ea2315efc3c540b8a5)) - MRDGH2821

### Miscellaneous Chores

- **(cocogitto)** add config - ([a1d081b](/commit/a1d081bbcbda469ea576febd40999f3039810760)) - MRDGH2821
- **(cspell)** update words - ([87e6ce9](/commit/87e6ce9ec8121c313c9f1f9a8ccdb9ed22420ad8)) - MRDGH2821
- ignore modules dir - ([eac5cd7](/commit/eac5cd74d8dde0e94a52109562ebe95ef01d518b)) - MRDGH2821

### Style

- sort properties - ([832f0ca](/commit/832f0ca806e17b20cbc1937ec2ec0cf480148d0d)) - MRDGH2821

---

## [0.0.17](/compare/v0.0.16..v0.0.17) - 2026-01-14

### Refactoring

- segregate global agents setting from project specific ones - ([5f016a0](/commit/5f016a0cc000a92700c5a8736a76c15d732ac2ab)) - MRDGH2821

---

## [0.0.16](/compare/v0.0.15..v0.0.16) - 2026-01-13

### Features

- **(copier)** add a question to use AGENTS.md file - ([df64e0f](/commit/df64e0f614cf31b1d795d2eab663b08c4ea4bbca)) - MRDGH2821

### Miscellaneous Chores

- **(copier)** add markdown lint config - ([949c2fe](/commit/949c2fe975a91c40b18b50cb228cc62923ed80cd)) - MRDGH2821
- **(copier)** add .github folder in template - ([9ed081b](/commit/9ed081b7cbd3a272040f2967b639da4cf801cb98)) - MRDGH2821

### Refactoring

- **(copier)** use a subdirectory for templates - ([18c97d1](/commit/18c97d1d9b652a847cf7a74c1cc7f848a80600fa)) - MRDGH2821

<!-- generated by git-cliff -->
