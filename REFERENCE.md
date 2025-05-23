# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`puppet_core_agent`](#puppet_core_agent): Configures Puppet Core repository and optionally manages the agent install
* [`puppet_core_agent::package`](#puppet_core_agent--package): Installs the puppet-agent core package to the specified version
* [`puppet_core_agent::repo`](#puppet_core_agent--repo): Configures Puppet Core repository

## Classes

### <a name="puppet_core_agent"></a>`puppet_core_agent`

Configures Puppet Core repository and optionally manages the agent install

#### Examples

##### Basic usage

```puppet
class { 'puppet_core_agent':
  forge_api_key  => 'MYAPIKEY',
  manage_package => true,
  version        => '8.11.0',
}
```

#### Parameters

The following parameters are available in the `puppet_core_agent` class:

* [`forge_api_key`](#-puppet_core_agent--forge_api_key)
* [`manage_package`](#-puppet_core_agent--manage_package)
* [`version`](#-puppet_core_agent--version)

##### <a name="-puppet_core_agent--forge_api_key"></a>`forge_api_key`

Data type: `String`

Forge API Key associated with an account that has signed the Puppet Core EULA

##### <a name="-puppet_core_agent--manage_package"></a>`manage_package`

Data type: `Boolean`

Toggle if you want the agent package managed or not

##### <a name="-puppet_core_agent--version"></a>`version`

Data type: `String`

Specify the target puppet core agent version

### <a name="puppet_core_agent--package"></a>`puppet_core_agent::package`

Installs the puppet-agent core package to the specified version

#### Examples

##### 

```puppet
include puppet_core_agent::package
```

### <a name="puppet_core_agent--repo"></a>`puppet_core_agent::repo`

Configures Puppet Core repository

#### Examples

##### 

```puppet
include puppet_core_agent::repo
```

