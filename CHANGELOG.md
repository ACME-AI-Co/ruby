# Changelog

## 0.1.0-alpha.2 (2025-05-08)

Full Changelog: [v0.1.0-alpha.1...v0.1.0-alpha.2](https://github.com/ACME-AI-Co/ruby/compare/v0.1.0-alpha.1...v0.1.0-alpha.2)

### ⚠ BREAKING CHANGES

* bump min supported ruby version to 3.1 (oldest non-EOL) ([#30](https://github.com/ACME-AI-Co/ruby/issues/30))
* remove top level type aliases to relocated classes ([#29](https://github.com/ACME-AI-Co/ruby/issues/29))

### Features

* add reference links in yard ([#20](https://github.com/ACME-AI-Co/ruby/issues/20)) ([13f6bab](https://github.com/ACME-AI-Co/ruby/commit/13f6bab908487639b1cba865fa0eae411fc94ce0))
* allow all valid `JSON` types to be encoded ([#40](https://github.com/ACME-AI-Co/ruby/issues/40)) ([3afba10](https://github.com/ACME-AI-Co/ruby/commit/3afba10577aacd40d93c422b255ee14f15bb9674))
* bump min supported ruby version to 3.1 (oldest non-EOL) ([#30](https://github.com/ACME-AI-Co/ruby/issues/30)) ([b70a7c0](https://github.com/ACME-AI-Co/ruby/commit/b70a7c0cf68787ec0ced31dbdcf6d8c723098efe))
* **client:** enable setting base URL from environment variable ([8b8de2f](https://github.com/ACME-AI-Co/ruby/commit/8b8de2f90a7d5d58d4f45626e93e4989f84cc614))
* **docs:** improve ([6ab28ec](https://github.com/ACME-AI-Co/ruby/commit/6ab28eccac23c665b2aea798aa20fa567682a4d7))
* implement `#hash` for data containers ([d6de50a](https://github.com/ACME-AI-Co/ruby/commit/d6de50a9bbd881fb7532a8d7878593042408d755))
* implement `to_json` for base model ([#26](https://github.com/ACME-AI-Co/ruby/issues/26)) ([eca50aa](https://github.com/ACME-AI-Co/ruby/commit/eca50aa08ebb3946dfcbfecee4ca6eafe0e02c3d))
* **internal:** converter interface should recurse without schema ([#11](https://github.com/ACME-AI-Co/ruby/issues/11)) ([b6b78f8](https://github.com/ACME-AI-Co/ruby/commit/b6b78f8fdacebb3d32584c445707ac8a0d060b6a))
* link response models to their methods in yard doc ([#22](https://github.com/ACME-AI-Co/ruby/issues/22)) ([42e053d](https://github.com/ACME-AI-Co/ruby/commit/42e053dc99d732b5f5f322f8e6ad46bf5d5aff2a))
* remove top level type aliases to relocated classes ([#29](https://github.com/ACME-AI-Co/ruby/issues/29)) ([81e14fc](https://github.com/ACME-AI-Co/ruby/commit/81e14fc8cfda17f73b7f6bdcd4ac1e99f5c71d81))
* support query, header, and body params that have identical names ([#39](https://github.com/ACME-AI-Co/ruby/issues/39)) ([37497da](https://github.com/ACME-AI-Co/ruby/commit/37497dac4a1848742c813b863471b41cbaf3b1a0))
* support solargraph generics ([#33](https://github.com/ACME-AI-Co/ruby/issues/33)) ([5ba4c87](https://github.com/ACME-AI-Co/ruby/commit/5ba4c875fd9910307190c6eb9164f40148646eae))
* support specifying content-type with FilePart class ([3c0f03b](https://github.com/ACME-AI-Co/ruby/commit/3c0f03b85d54bce655a45bf54adc4f0992d7e5ae))
* support webmock for testing ([70ad362](https://github.com/ACME-AI-Co/ruby/commit/70ad36294cfe3f0baa7e07dc70994478dcfe024f))
* use Pathname alongside raw IO handles for file uploads ([#51](https://github.com/ACME-AI-Co/ruby/issues/51)) ([f3bdbd3](https://github.com/ACME-AI-Co/ruby/commit/f3bdbd3714a92cd70629e0f73e2a5797f0bb3077))


### Bug Fixes

* always send idempotency header when specified as a request option ([cbc2005](https://github.com/ACME-AI-Co/ruby/commit/cbc2005d354c6e3f7715569880c84bb30565d906))
* **client:** send correct HTTP path ([b6c169f](https://github.com/ACME-AI-Co/ruby/commit/b6c169fdf7b72f34da5fb5ebac5c4e22b84a8e1d))
* converter should transform stringio into string where applicable ([#42](https://github.com/ACME-AI-Co/ruby/issues/42)) ([8c2eb20](https://github.com/ACME-AI-Co/ruby/commit/8c2eb2024f2dd1aff597cbdd3223c8c25f404c3b))
* ensure gem release is unaffected by renaming ([ea626f9](https://github.com/ACME-AI-Co/ruby/commit/ea626f998f46a8f255fcc51468946f13870acd6e))
* inaccuracies in the README.md ([381e684](https://github.com/ACME-AI-Co/ruby/commit/381e6848c75a983a7e280f535cd9c4ea71a73ecb))
* **internal:** ensure formatting always uses c.utf-8 locale ([ccc511f](https://github.com/ACME-AI-Co/ruby/commit/ccc511f77bfacc35d6888772cfadf0ce936fcdac))
* **internal:** fix formatting script for macos ([a7ff519](https://github.com/ACME-AI-Co/ruby/commit/a7ff519c36417c76e98c51229cf927c1643309d7))
* **internal:** update release-please to use ruby strategy for README.md ([468784b](https://github.com/ACME-AI-Co/ruby/commit/468784b50898b8bf62866fa94ecfe81489653707))
* make a typo for `FilePart.content` ([1ceaf44](https://github.com/ACME-AI-Co/ruby/commit/1ceaf44697f491d6823ff5e63708a5f1797be5fd))
* path interpolation template strings ([#19](https://github.com/ACME-AI-Co/ruby/issues/19)) ([36b72f1](https://github.com/ACME-AI-Co/ruby/commit/36b72f1f3b6290193f2aab7a4671aa1bf182f74f))
* pre-release version string should match ruby, not semver conventions ([#32](https://github.com/ACME-AI-Co/ruby/issues/32)) ([403a2ba](https://github.com/ACME-AI-Co/ruby/commit/403a2ba7f09d748d1569d7d46bb0f17bc51fdc30))
* raise connection error for errors that result from HTTP transports ([#52](https://github.com/ACME-AI-Co/ruby/issues/52)) ([4b571b8](https://github.com/ACME-AI-Co/ruby/commit/4b571b869f04a3947e0c2a226a035e5764d2a8ad))
* switch to github compatible markdown engine ([#16](https://github.com/ACME-AI-Co/ruby/issues/16)) ([0b3f1c9](https://github.com/ACME-AI-Co/ruby/commit/0b3f1c9dc5753bb106f850a3b86397fa11e7fcdb))


### Chores

* accept all nd-json mimetype variants ([2977da3](https://github.com/ACME-AI-Co/ruby/commit/2977da32bcde6c28feae6477e1e76fffac70e3a0))
* add generator safe directory ([b537fb5](https://github.com/ACME-AI-Co/ruby/commit/b537fb5588d02d2597c0badf48d3e102080927d7))
* add README docs for using solargraph when installing gem from git ([#50](https://github.com/ACME-AI-Co/ruby/issues/50)) ([8a8d59c](https://github.com/ACME-AI-Co/ruby/commit/8a8d59c3310cb3e92cee0a935eba15c9075d3476))
* always fold up method bodies in sorbet type definitions ([#46](https://github.com/ACME-AI-Co/ruby/issues/46)) ([eec160a](https://github.com/ACME-AI-Co/ruby/commit/eec160a95796026fa103e3c917d6f35bfe3afe37))
* broadly detect json family of content-type headers ([ca51246](https://github.com/ACME-AI-Co/ruby/commit/ca51246af6e8a76d512abfcc6829f5a0d06903b4))
* **ci:** add timeout thresholds for CI jobs ([b3a897d](https://github.com/ACME-AI-Co/ruby/commit/b3a897d1b5d17f86bf1d3f92b57115c66c28c9dc))
* **ci:** only use depot for staging repos ([abb421e](https://github.com/ACME-AI-Co/ruby/commit/abb421e884e9d0ff09d198938deed8d3045065eb))
* demonstrate how to make undocumented requests in README ([#31](https://github.com/ACME-AI-Co/ruby/issues/31)) ([1aece97](https://github.com/ACME-AI-Co/ruby/commit/1aece97a06e972024e19b80add37ef9270089877))
* do not use literals for version in type definitions ([#34](https://github.com/ACME-AI-Co/ruby/issues/34)) ([8d3a996](https://github.com/ACME-AI-Co/ruby/commit/8d3a9963b75cce56d7b369fc347830150b7edf3c))
* document LSP support in read me ([#38](https://github.com/ACME-AI-Co/ruby/issues/38)) ([097630d](https://github.com/ACME-AI-Co/ruby/commit/097630d8b523cbe305c373006c4a62ed2ddba33e))
* documentation improvements ([346a191](https://github.com/ACME-AI-Co/ruby/commit/346a191c05f6f97bb5a5c1e6e2259283ea9b9f47))
* ensure readme.md is bumped when release please updates versions ([6480129](https://github.com/ACME-AI-Co/ruby/commit/6480129888c1c0bce2a24f9b66d7b0dfafebdcd2))
* explicitly mark apis public under `Internal` module ([c01effb](https://github.com/ACME-AI-Co/ruby/commit/c01effbe67bf0a20e1867f5f6d0ae4b688253297))
* extract error classes into own module ([#27](https://github.com/ACME-AI-Co/ruby/issues/27)) ([2ce59df](https://github.com/ACME-AI-Co/ruby/commit/2ce59df6483096f385c7cb23dcb11755da953fee))
* fix lsp configuration file for local development ([5879eb5](https://github.com/ACME-AI-Co/ruby/commit/5879eb5bdf2f8ca0b7da44956e26753b5b6a3dd9))
* fix misc rubocop errors ([#17](https://github.com/ACME-AI-Co/ruby/issues/17)) ([ca31d42](https://github.com/ACME-AI-Co/ruby/commit/ca31d42b4b12b9c163f6c3cdeaae3234657189dc))
* fix readme typo ([89562ef](https://github.com/ACME-AI-Co/ruby/commit/89562ef0f0968952936f40d79bb6b54af248a8da))
* improve yard docs readability ([#21](https://github.com/ACME-AI-Co/ruby/issues/21)) ([4d862d7](https://github.com/ACME-AI-Co/ruby/commit/4d862d73c620f7a4904e748b203b714cc4e8bd1b))
* **internal:** always run post-processing when formatting when syntax_tree ([cbe6cc2](https://github.com/ACME-AI-Co/ruby/commit/cbe6cc2f55f770a3383effafe357b1fcf3c0c3dd))
* **internal:** annotate request options with type aliases in sorbet ([10e6898](https://github.com/ACME-AI-Co/ruby/commit/10e689804be7954f6b2a93695c87ceaa7b5688f8))
* **internal:** codegen related update ([d4b3968](https://github.com/ACME-AI-Co/ruby/commit/d4b39681859af93d846365517c765c2629b599f0))
* **internal:** codegen related update ([875bfc6](https://github.com/ACME-AI-Co/ruby/commit/875bfc63a3f55f542ef69740dc9b23d9280ab390))
* **internal:** codegen related update ([df47a3e](https://github.com/ACME-AI-Co/ruby/commit/df47a3e5e3e3d67befd845fb875ebc62cb22f173))
* **internal:** codegen related update ([711b3aa](https://github.com/ACME-AI-Co/ruby/commit/711b3aafb46c2b7567fdd341c7093758d1bfc878))
* **internal:** codegen related update ([#23](https://github.com/ACME-AI-Co/ruby/issues/23)) ([768d056](https://github.com/ACME-AI-Co/ruby/commit/768d056ed354815cc6b8c8305a3641174414b220))
* **internal:** codegen related update ([#48](https://github.com/ACME-AI-Co/ruby/issues/48)) ([4492a7b](https://github.com/ACME-AI-Co/ruby/commit/4492a7b5391bb5be4446d8826d8a31afe868afab))
* **internal:** contribute.md and contributor QoL improvements ([5bf8fb1](https://github.com/ACME-AI-Co/ruby/commit/5bf8fb1c3bd326a656ad4d10e5379dc66d15825a))
* **internal:** expand CI branch coverage ([9a542e2](https://github.com/ACME-AI-Co/ruby/commit/9a542e2d46195f615aa3c0073849bb8a8c08172f))
* **internal:** improve response envelope unwrap functionality ([098dff8](https://github.com/ACME-AI-Co/ruby/commit/098dff807d8601ea41b1bc014d929dc8f7b8e37f))
* **internal:** loosen internal type restrictions ([3a0e55b](https://github.com/ACME-AI-Co/ruby/commit/3a0e55bfdc6605a87e2fa3cf5e222925c0fb94ba))
* **internal:** minor refactoring of utils ([#10](https://github.com/ACME-AI-Co/ruby/issues/10)) ([1d26878](https://github.com/ACME-AI-Co/ruby/commit/1d268784f36770da964a5939765c33ff69e6a67a))
* **internal:** minor touch ups on sdk internals ([43be203](https://github.com/ACME-AI-Co/ruby/commit/43be2036199ead9e6111e7a69161211cc5467278))
* **internal:** minor type annotation improvements ([2db0181](https://github.com/ACME-AI-Co/ruby/commit/2db0181dc951b306590f0366670c2e375b8a0407))
* **internal:** misc small improvements ([#43](https://github.com/ACME-AI-Co/ruby/issues/43)) ([c1f4ab5](https://github.com/ACME-AI-Co/ruby/commit/c1f4ab5282c8de22f8c9c3839542d7466a473f62))
* **internal:** mostly README touch ups ([5af44e4](https://github.com/ACME-AI-Co/ruby/commit/5af44e4a14cf9d930b722910c5a958dbbb0683dc))
* **internal:** protect SSE parsing pipeline from broken UTF-8 characters ([15f4d46](https://github.com/ACME-AI-Co/ruby/commit/15f4d46643cb2bc459ab80224700497612e4d4ec))
* **internal:** reduce CI branch coverage ([b97d758](https://github.com/ACME-AI-Co/ruby/commit/b97d7586464ae448bdc9ebca3a6db2c19007a75f))
* **internal:** remove unnecessary `rbi/lib` folder ([363e9b2](https://github.com/ACME-AI-Co/ruby/commit/363e9b2aff90be820b8409c646109bb9ee2cde7b))
* **internal:** rubocop rules ([#45](https://github.com/ACME-AI-Co/ruby/issues/45)) ([e0211b0](https://github.com/ACME-AI-Co/ruby/commit/e0211b01e4d4ad8b56f1a698fdd358e5e65abdbd))
* **internal:** run rubocop linter in parallel ([#44](https://github.com/ACME-AI-Co/ruby/issues/44)) ([0b1f550](https://github.com/ACME-AI-Co/ruby/commit/0b1f550cbcf405fdda5b060ac1e8886d7c6f7ff1))
* **internal:** version bump ([#6](https://github.com/ACME-AI-Co/ruby/issues/6)) ([123f1f0](https://github.com/ACME-AI-Co/ruby/commit/123f1f0e351babf4d9afc7f14bdbca5d87ea0e72))
* loosen const and integer coercion rules ([#53](https://github.com/ACME-AI-Co/ruby/issues/53)) ([1f079d1](https://github.com/ACME-AI-Co/ruby/commit/1f079d1e54f7d0d869a36c437758a299c805ce1f))
* loosen rubocop rules that don't always make sense ([5ee37b5](https://github.com/ACME-AI-Co/ruby/commit/5ee37b521d8a5eb90cd5fb35c0fa39d85f00611a))
* make client tests look prettier ([#49](https://github.com/ACME-AI-Co/ruby/issues/49)) ([7277959](https://github.com/ACME-AI-Co/ruby/commit/7277959e85742244f1e178d8fdf283b37a27ad93))
* make internal types pretty print ([8d841ae](https://github.com/ACME-AI-Co/ruby/commit/8d841aef5180f79c79b224da3d18a7c0d50bdad6))
* make sorbet enums easier to read ([20da618](https://github.com/ACME-AI-Co/ruby/commit/20da618dbe17e140d478a0ecf417082b808d7a13))
* misc sdk polish ([#37](https://github.com/ACME-AI-Co/ruby/issues/37)) ([827ca6c](https://github.com/ACME-AI-Co/ruby/commit/827ca6c02aa4f269d7dd0e6f8a99f2e041934d46))
* more accurate type annotations and aliases ([cdcb826](https://github.com/ACME-AI-Co/ruby/commit/cdcb8263cd80ce33adc891467380b11183f6a004))
* more accurate type annotations for SDK internals ([#14](https://github.com/ACME-AI-Co/ruby/issues/14)) ([f4d92a9](https://github.com/ACME-AI-Co/ruby/commit/f4d92a9c5faa4f93e0d1c7500f7f44142f972b05))
* more aggressive tapioca detection logic for skipping compiler introspection ([#9](https://github.com/ACME-AI-Co/ruby/issues/9)) ([5e019aa](https://github.com/ACME-AI-Co/ruby/commit/5e019aa0d3f5c1f076b3f2bb2dd7d96d51bdca21))
* move private classes into internal module ([#28](https://github.com/ACME-AI-Co/ruby/issues/28)) ([de47a06](https://github.com/ACME-AI-Co/ruby/commit/de47a0602064ede390f331035ec080742ce11842))
* order client variables by "importance" ([#25](https://github.com/ACME-AI-Co/ruby/issues/25)) ([57289a6](https://github.com/ACME-AI-Co/ruby/commit/57289a6d539997c8755bd97a693dd109d42e8796))
* re-export top level models under library namespace ([e22737c](https://github.com/ACME-AI-Co/ruby/commit/e22737c5c937f5ea6a770204c0a68fab15acdf8f))
* refine `#inspect` and `#to_s` for model classes ([fa09a40](https://github.com/ACME-AI-Co/ruby/commit/fa09a40e16584d425ef806e00ca900442cdbe16e))
* relax sorbet enum parameters to allow `String` in addition to `Symbol` ([#24](https://github.com/ACME-AI-Co/ruby/issues/24)) ([a3a3195](https://github.com/ACME-AI-Co/ruby/commit/a3a3195f287dcb23f359e75d8442ac96ba655023))
* relocate internal modules ([#13](https://github.com/ACME-AI-Co/ruby/issues/13)) ([91a6fff](https://github.com/ACME-AI-Co/ruby/commit/91a6ffff8964aaa2e682bfc8392e8bed01859e8c))
* remove Gemfile.lock during bootstrap ([e76cfc2](https://github.com/ACME-AI-Co/ruby/commit/e76cfc2f220078d6e1320b72460ecc7e7fffd5b8))
* remove unnecessary & confusing module ([#12](https://github.com/ACME-AI-Co/ruby/issues/12)) ([2c7b6af](https://github.com/ACME-AI-Co/ruby/commit/2c7b6af42b9251f7e8f03d4dbb74a93c16c59801))
* rename confusing `Type::BooleanModel` to `Type::Boolean` ([#41](https://github.com/ACME-AI-Co/ruby/issues/41)) ([a0426b3](https://github.com/ACME-AI-Co/ruby/commit/a0426b3de0c83ee974f0d4ccb624f245fb5d055f))
* revert ignoring Gemfile.lock ([1a021d6](https://github.com/ACME-AI-Co/ruby/commit/1a021d687b7b741e33bcc9d454b4f5aafe7210ee))
* show truncated parameter docs in yard ([7734dfe](https://github.com/ACME-AI-Co/ruby/commit/7734dfe070d046293ee11ca21f9851f2a5c45d34))
* simplify internal utils ([#36](https://github.com/ACME-AI-Co/ruby/issues/36)) ([242dff3](https://github.com/ACME-AI-Co/ruby/commit/242dff3c93c050cab501237b349e5627a0a60df3))
* simplify yard annotations by removing most `@!parse` directives ([750960d](https://github.com/ACME-AI-Co/ruby/commit/750960ddcd8bf79e0fc98f4b13b716e124b558b8))
* update readme ([#15](https://github.com/ACME-AI-Co/ruby/issues/15)) ([bc3e3f6](https://github.com/ACME-AI-Co/ruby/commit/bc3e3f661e6e287e9cd4143a19aeadf3347b650e))
* update README with recommended editor plugins ([c1e611d](https://github.com/ACME-AI-Co/ruby/commit/c1e611d3a3455c2ca9051af4a6dd098b03727537))
* update yard comment formatting ([#47](https://github.com/ACME-AI-Co/ruby/issues/47)) ([fa48efc](https://github.com/ACME-AI-Co/ruby/commit/fa48efc34669855a974a013b3a394d540fe47687))
* use `@!method` instead of `@!parse` for virtual method type definitions ([0d62358](https://github.com/ACME-AI-Co/ruby/commit/0d62358463b1e1d76274e04820ad96dcf410c4a1))
* use fully qualified name in sorbet README example ([#18](https://github.com/ACME-AI-Co/ruby/issues/18)) ([a18725a](https://github.com/ACME-AI-Co/ruby/commit/a18725a7a996bc3db7759c09925092d9b3f53105))
* use package name for gemspec ([#35](https://github.com/ACME-AI-Co/ruby/issues/35)) ([47e7835](https://github.com/ACME-AI-Co/ruby/commit/47e7835165e6065ba9b8693c530a4bf54b6072fc))
* validate request option coercion correctness ([b3be86b](https://github.com/ACME-AI-Co/ruby/commit/b3be86bb77c6802bb9e09e27ba42fb6b8f9932a6))


### Documentation

* illustrate environmental defaults for auth variables ([ed4661e](https://github.com/ACME-AI-Co/ruby/commit/ed4661e68300afb229edc1714060321bba047211))
* update documentation links to be more uniform ([eee6bdd](https://github.com/ACME-AI-Co/ruby/commit/eee6bddd38aca575ce4cf9d73dc7237f0cfdf75e))

## 0.1.0-alpha.1 (2025-03-26)

Full Changelog: [v0.0.1-alpha.0...v0.1.0-alpha.1](https://github.com/ACME-AI-Co/ruby/compare/v0.0.1-alpha.0...v0.1.0-alpha.1)

### Features

* **api:** update via SDK Studio ([#1](https://github.com/ACME-AI-Co/ruby/issues/1)) ([ff2eec4](https://github.com/ACME-AI-Co/ruby/commit/ff2eec468a73c96579c2a9e7e7cdd70d714d68df))
* **docs:** add example script ([1947c7a](https://github.com/ACME-AI-Co/ruby/commit/1947c7aeea50caea98d5b04f210f6dbbf5d185cf))


### Chores

* configure new SDK language ([80eeb01](https://github.com/ACME-AI-Co/ruby/commit/80eeb016c8c566f68863b6215bb2e9938c57fd0c))
* disable dangerous rubocop auto correct rule ([#4](https://github.com/ACME-AI-Co/ruby/issues/4)) ([226e3a7](https://github.com/ACME-AI-Co/ruby/commit/226e3a72ece8f5ba816b2f22f010351942acdaac))
* more readable output when tests fail ([#5](https://github.com/ACME-AI-Co/ruby/issues/5)) ([53fea16](https://github.com/ACME-AI-Co/ruby/commit/53fea163d6d0ee505375e1e3905ccc5752190946))
* reduce verbosity in type declarations ([#3](https://github.com/ACME-AI-Co/ruby/issues/3)) ([70071e9](https://github.com/ACME-AI-Co/ruby/commit/70071e9729563b1ac7fc8af08556f57d8cd651fd))
