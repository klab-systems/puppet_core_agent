# puppet_core_agent

Welcome to puppet_core_agent. This module is to streamline the Puppet Core adoption process whether you are coming from an existing OSP implementation or deploying from scratch.

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with puppet_core_agent](#setup)
    * [What puppet_core_agent affects](#what-puppet_core_agent-affects)
    * [Beginning with puppet_core_agent](#beginning-with-puppet_core_agent)
1. [Usage - Configuration options and additional functionality](#usage)

## Description

puppet_core_agent module configures installation sources for the Puppet Core packages and optionally installs the specified agent version.

## Setup

### What puppet_core_agent affects

RedHat - Creates /etc/yum.repo.d/puppet-core.repo ; Optionally installs puppet-agent

Ubuntu - Creates /etc/apt/sources.list.d/$puppet_release.list ; Creates /etc/apt/auth.conf ; Optionally installs puppet-agent

Windows - Executes PowerShell script to download MSI installer to C:\Windows\Temp\ ; Optionally installs agent from local MSI installer

### Beginning with puppet_core_agent

A Forge API Key associated with an account that either has a Puppet Core entitlement or has accepted the Puppet Core EULA is required for module use. Please see the following Puppet Core documentation for further details [purchase](https://www.puppet.com/docs/puppet/8/system_requirements#plan_requirements) , [limited-use](https://www.puppet.com/docs/puppet/8/system_requirements#access_core_for_test_dev)

You will then need to install the puppet_core_agent module and relevant dependencies for your target operating system(s).


## Usage

Classify target node(s) with the puppet_core_agent_class via a resource-like declaration such as:

```ruby
class { 'puppet_core_agent':
  forge_api_key => 'MYAPIKEY',
  manage_package => true,
  version => '8.11.0',
}
```

OR include puppet_core_agent and pass in your data via hiera with the respective keys.

```yaml
puppet_core_agent::forge_api_key: MYAPIKEY
puppet_core_agent::manage_package: true
puppet_core_agent::version: 8.11.0
```

**Note**: Version is not the same on all platforms. Example - for puppet-agent version 8.11.0 on RedHat 9 and Windows Server 2022 set version to '8.11.0' but for Ubuntu 22.04 it is '8.11.0-1jammy'. So be sure to validate the version name is accurate for your operating system version.