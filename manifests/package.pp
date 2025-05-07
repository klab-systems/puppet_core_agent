# @summary Installs the puppet-agent core package to the specified version
#
# @example
#   include puppet_core_agent::package
class puppet_core_agent::package {
  case $facts['os']['family'] {
    'windows': {
      package { 'Puppet Agent (64-bit)':
        ensure => $puppet_core_agent::version,
        source => "C:/Windows/Temp/puppet-agent-${puppet_core_agent::version}-${facts['os']['architecture']}.msi",
      }
    }
    'Debian': {
      package { 'puppet-agent':
        ensure => "${puppet_core_agent::version}-1${facts['os']['distro']['codename']}",
      }
    }
    'RedHat': {
      package { 'puppet-agent':
        ensure => $puppet_core_agent::version,
      }
    }
    default: {
      fail('Unsupported Operating System Detected')
    }
  }
}
