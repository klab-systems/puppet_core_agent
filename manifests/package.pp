# @summary Installs the puppet-agent core package to the specified version
#
# @example
#   include puppet_core_agent::package
class puppet_core_agent::package {
  package { 'puppet-agent':
    ensure => $puppet_core_agent::version,
  }
}
