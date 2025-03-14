# @summary Installs the puppet-agent core package to the specified version
#
# @example
#   include puppet_core_agent::package
class puppet_core_agent::package {
  if $facts['os']['family'] == 'windows' {
    package { 'puppet-agent':
      ensure => $puppet_core_agent::version,
      source => "C:/Windows/Temp/puppet-agent-${puppet_core_agent::version}-${facts['os']['architecture']}.msi",
    }
  } else {
    package { 'puppet-agent':
      ensure => $puppet_core_agent::version,
    }
  }
}
