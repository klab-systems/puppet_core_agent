# Changelog

All notable changes to this project will be documented in this file.

## Release 1.0.0

**Breaking changes and upgrade notes**

- Change the default Puppet agent version from 8.19.0 to 9.1.0. This selects the Puppet 9 repository on Linux, even when `manage_package` is `false`. When `manage_package` is `true`, the module also installs the specified agent version. To remain on Puppet 8, explicitly set `puppet_core_agent::version` to a supported 8.x version, such as `8.19.0`, before upgrading the module. Package management remains disabled by default.
- Drop Puppet 7 support. The supported Puppet version range is now `>= 8.0.0 < 10.0.0` (previously `>= 7.24 < 9.0.0`).
- Require `puppetlabs/stdlib` `>= 10.0.0 < 11.0.0`, replacing `>= 9.7.0 < 10.0.0`. Upgrade this dependency alongside the module.
- Remove Debian 10, RedHat 7, Ubuntu 18.04 and 20.04, and Windows Server 2012 R2 from the supported operating systems.

**Features**

- Add Puppet 9 support, including selection of the `puppet9` package repository. Explicitly configured Puppet 8 versions continue to select `puppet8`.
- Add AlmaLinux 10, RedHat 10, Rocky Linux 10, Debian 13, and Ubuntu 26.04 to the supported operating systems.

**Maintenance**

- Update PDK from 3.6.1 to 4.0.1 and refresh the PDK template, RuboCop configuration, and development dependencies.
- Default development gem resolution for Puppet, Facter, and Bolt to the Puppet Core gem source, regardless of credential availability. Configure credentials for that source, or run `bundle config set gemsource.public true` to use public gems instead. `GEM_SOURCE_PUPPETCORE` is no longer used to select the source. For airgapped development, `bundle config set gemsource.airgapped true` suppresses the missing-credentials warning without changing the source.
- Add Ruby-dependent default Puppet gem constraints for development: `~> 9.0` on Ruby 3.4 or newer and `~> 8.17` on Ruby 3.1 through 3.3. `PUPPET_GEM_VERSION` continues to override these defaults; public gem mode does not apply them.
- Update Puppet Litmus to 2.5.x, select compatible lint plugins and spec helpers for Core or public gems, and widen the supported Puppet Strings and Puppet Blacksmith development dependency ranges.
- Allow Rake syntax tasks to use either `puppet-syntax` or `puppetlabs-syntax`, depending on the installed gems.
- Correct the module packaging exclusion for `.rubocop.yml`.
- Update usage examples to Puppet 9.1.0.

## Release 0.4.0

**Features**

- Add Windows Server 2025 to supported operating systems
- Bump default Puppet agent version from 8.11.0 to 8.19.0

**Maintenance**

- Widen dependency version ranges: `puppetlabs/apt` (< 12.0.0), `puppetlabs/pwshlib` (< 3.0.0), `puppetlabs/yumrepo_core` (< 4.0.0)
- Update PDK from 3.4.0 to 3.6.1
- Update RuboCop configuration to use `plugins` key and raise target Ruby version to 3.1
- Update Gemfile dependencies

**Bugfixes**

**Known Issues**

## Release 0.1.0

**Features**

**Bugfixes**

**Known Issues**
