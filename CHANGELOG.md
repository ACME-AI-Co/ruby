# Changelog

## 0.1.0-alpha.2 (2025-04-04)

Full Changelog: [v0.1.0-alpha.1...v0.1.0-alpha.2](https://github.com/ACME-AI-Co/ruby/compare/v0.1.0-alpha.1...v0.1.0-alpha.2)

### ⚠ BREAKING CHANGES

* bump min supported ruby version to 3.1 (oldest non-EOL) ([#30](https://github.com/ACME-AI-Co/ruby/issues/30))
* remove top level type aliases to relocated classes ([#29](https://github.com/ACME-AI-Co/ruby/issues/29))

### Features

* add reference links in yard ([#20](https://github.com/ACME-AI-Co/ruby/issues/20)) ([13f6bab](https://github.com/ACME-AI-Co/ruby/commit/13f6bab908487639b1cba865fa0eae411fc94ce0))
* bump min supported ruby version to 3.1 (oldest non-EOL) ([#30](https://github.com/ACME-AI-Co/ruby/issues/30)) ([b70a7c0](https://github.com/ACME-AI-Co/ruby/commit/b70a7c0cf68787ec0ced31dbdcf6d8c723098efe))
* **docs:** improve ([6ab28ec](https://github.com/ACME-AI-Co/ruby/commit/6ab28eccac23c665b2aea798aa20fa567682a4d7))
* implement `to_json` for base model ([#26](https://github.com/ACME-AI-Co/ruby/issues/26)) ([eca50aa](https://github.com/ACME-AI-Co/ruby/commit/eca50aa08ebb3946dfcbfecee4ca6eafe0e02c3d))
* **internal:** converter interface should recurse without schema ([#11](https://github.com/ACME-AI-Co/ruby/issues/11)) ([b6b78f8](https://github.com/ACME-AI-Co/ruby/commit/b6b78f8fdacebb3d32584c445707ac8a0d060b6a))
* link response models to their methods in yard doc ([#22](https://github.com/ACME-AI-Co/ruby/issues/22)) ([42e053d](https://github.com/ACME-AI-Co/ruby/commit/42e053dc99d732b5f5f322f8e6ad46bf5d5aff2a))
* remove top level type aliases to relocated classes ([#29](https://github.com/ACME-AI-Co/ruby/issues/29)) ([81e14fc](https://github.com/ACME-AI-Co/ruby/commit/81e14fc8cfda17f73b7f6bdcd4ac1e99f5c71d81))
* support solargraph generics ([#33](https://github.com/ACME-AI-Co/ruby/issues/33)) ([5ba4c87](https://github.com/ACME-AI-Co/ruby/commit/5ba4c875fd9910307190c6eb9164f40148646eae))


### Bug Fixes

* path interpolation template strings ([#19](https://github.com/ACME-AI-Co/ruby/issues/19)) ([36b72f1](https://github.com/ACME-AI-Co/ruby/commit/36b72f1f3b6290193f2aab7a4671aa1bf182f74f))
* pre-release version string should match ruby, not semver conventions ([#32](https://github.com/ACME-AI-Co/ruby/issues/32)) ([403a2ba](https://github.com/ACME-AI-Co/ruby/commit/403a2ba7f09d748d1569d7d46bb0f17bc51fdc30))
* switch to github compatible markdown engine ([#16](https://github.com/ACME-AI-Co/ruby/issues/16)) ([0b3f1c9](https://github.com/ACME-AI-Co/ruby/commit/0b3f1c9dc5753bb106f850a3b86397fa11e7fcdb))


### Chores

* demonstrate how to make undocumented requests in README ([#31](https://github.com/ACME-AI-Co/ruby/issues/31)) ([1aece97](https://github.com/ACME-AI-Co/ruby/commit/1aece97a06e972024e19b80add37ef9270089877))
* do not use literals for version in type definitions ([#34](https://github.com/ACME-AI-Co/ruby/issues/34)) ([8d3a996](https://github.com/ACME-AI-Co/ruby/commit/8d3a9963b75cce56d7b369fc347830150b7edf3c))
* extract error classes into own module ([#27](https://github.com/ACME-AI-Co/ruby/issues/27)) ([2ce59df](https://github.com/ACME-AI-Co/ruby/commit/2ce59df6483096f385c7cb23dcb11755da953fee))
* fix misc rubocop errors ([#17](https://github.com/ACME-AI-Co/ruby/issues/17)) ([ca31d42](https://github.com/ACME-AI-Co/ruby/commit/ca31d42b4b12b9c163f6c3cdeaae3234657189dc))
* improve yard docs readability ([#21](https://github.com/ACME-AI-Co/ruby/issues/21)) ([4d862d7](https://github.com/ACME-AI-Co/ruby/commit/4d862d73c620f7a4904e748b203b714cc4e8bd1b))
* **internal:** codegen related update ([#23](https://github.com/ACME-AI-Co/ruby/issues/23)) ([768d056](https://github.com/ACME-AI-Co/ruby/commit/768d056ed354815cc6b8c8305a3641174414b220))
* **internal:** minor refactoring of utils ([#10](https://github.com/ACME-AI-Co/ruby/issues/10)) ([1d26878](https://github.com/ACME-AI-Co/ruby/commit/1d268784f36770da964a5939765c33ff69e6a67a))
* **internal:** version bump ([#6](https://github.com/ACME-AI-Co/ruby/issues/6)) ([123f1f0](https://github.com/ACME-AI-Co/ruby/commit/123f1f0e351babf4d9afc7f14bdbca5d87ea0e72))
* more accurate type annotations for SDK internals ([#14](https://github.com/ACME-AI-Co/ruby/issues/14)) ([f4d92a9](https://github.com/ACME-AI-Co/ruby/commit/f4d92a9c5faa4f93e0d1c7500f7f44142f972b05))
* more aggressive tapioca detection logic for skipping compiler introspection ([#9](https://github.com/ACME-AI-Co/ruby/issues/9)) ([5e019aa](https://github.com/ACME-AI-Co/ruby/commit/5e019aa0d3f5c1f076b3f2bb2dd7d96d51bdca21))
* move private classes into internal module ([#28](https://github.com/ACME-AI-Co/ruby/issues/28)) ([de47a06](https://github.com/ACME-AI-Co/ruby/commit/de47a0602064ede390f331035ec080742ce11842))
* order client variables by "importance" ([#25](https://github.com/ACME-AI-Co/ruby/issues/25)) ([57289a6](https://github.com/ACME-AI-Co/ruby/commit/57289a6d539997c8755bd97a693dd109d42e8796))
* relax sorbet enum parameters to allow `String` in addition to `Symbol` ([#24](https://github.com/ACME-AI-Co/ruby/issues/24)) ([a3a3195](https://github.com/ACME-AI-Co/ruby/commit/a3a3195f287dcb23f359e75d8442ac96ba655023))
* relocate internal modules ([#13](https://github.com/ACME-AI-Co/ruby/issues/13)) ([91a6fff](https://github.com/ACME-AI-Co/ruby/commit/91a6ffff8964aaa2e682bfc8392e8bed01859e8c))
* remove unnecessary & confusing module ([#12](https://github.com/ACME-AI-Co/ruby/issues/12)) ([2c7b6af](https://github.com/ACME-AI-Co/ruby/commit/2c7b6af42b9251f7e8f03d4dbb74a93c16c59801))
* update readme ([#15](https://github.com/ACME-AI-Co/ruby/issues/15)) ([bc3e3f6](https://github.com/ACME-AI-Co/ruby/commit/bc3e3f661e6e287e9cd4143a19aeadf3347b650e))
* use fully qualified name in sorbet README example ([#18](https://github.com/ACME-AI-Co/ruby/issues/18)) ([a18725a](https://github.com/ACME-AI-Co/ruby/commit/a18725a7a996bc3db7759c09925092d9b3f53105))
* use package name for gemspec ([#35](https://github.com/ACME-AI-Co/ruby/issues/35)) ([47e7835](https://github.com/ACME-AI-Co/ruby/commit/47e7835165e6065ba9b8693c530a4bf54b6072fc))

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
