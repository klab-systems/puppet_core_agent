# @summary Configures Puppet Core repository and manages the agent
#
# @example
#   include puppet_core_agent
#
# @param forge_api_key
#  Forge API Key associated with an account that has signed the Puppet Core EULA
#
#
# @param manage_package
#  Toggle if you want the agent package managed or not
#
# @param version
#  Specify the target puppet core agent version
class puppet_core_agent (
  String $forge_api_key,
  Boolean $manage_package,
  String $version,
) {
  $puppet_release = $version ? {
    /^8/  => 'puppet8',
    default => fail('Unsupported puppet version')
  }

  case $facts['os']['family'] {
    'RedHat': {
      yumrepo { $puppet_release:
        ensure   => 'present',
        name     => $puppet_release,
        descr    => "Puppet ${puppet_release[6]} Repository el ${facts['os']['release']['major']} - \$basearch",
        baseurl  => "https://yum-puppetcore.puppet.com/${puppet_release}/el/${facts['os']['release']['major']}/\$basearch",
        enabled  => '1',
        gpgkey   => 'https://yum-puppetcore.puppet.com/public/RPM-GPG-KEY-puppet-20250406',
        gpgcheck => '1',
        username => 'forge-key',
        password => Sensitive($forge_api_key),
        target   => '/etc/yum.repo.d/puppet-core.repo',
      }
    }
    default: {
      fail('Unsupported Operating System Detected')
    }
  }

  if $manage_package {
    package { 'puppet_agent':
      ensure => $version,
    }
  }
}
