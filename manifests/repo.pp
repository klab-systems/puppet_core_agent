# @summary Configures Puppet Core repository
#
# @example
#   include puppet_core_agent::repo
class puppet_core_agent::repo {
  $puppet_release = $puppet_core_agent::version ? {
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
        password => Sensitive($puppet_core_agent::forge_api_key),
        target   => '/etc/yum.repo.d/puppet-core.repo',
      }
    }
    'Debian': {
      class { 'apt':
        auth_conf_entries => [
          {
            'machine'  => 'apt-puppetcore.puppet.com',
            'login'    => 'forge-key',
            'password' => $puppet_core_agent::forge_api_key,
          },
        ],
      }

      apt::source { $puppet_release:
        location => 'https://apt-puppetcore.puppet.com',
        repos    => $puppet_release,
        key      => {
          'name'   => 'RPM-GPG-KEY-puppet-20250406',
          'source' => 'https://apt-puppetcore.puppet.com/public/RPM-GPG-KEY-puppet-20250406',
        },
      }
    }
    default: {
      fail('Unsupported Operating System Detected')
    }
  }
}
