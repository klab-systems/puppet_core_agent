# @summary Configures Puppet Core repository and optionally manages the agent install
#
# @example Basic usage
#   class { 'puppet_core_agent':
#     forge_api_key  => 'MYAPIKEY',
#     manage_package => true,
#     version        => '8.11.0',
#   }
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
  Variant[Sensitive[String], String] $forge_api_key,
  Boolean $manage_package,
  String $version,
) {
  if $manage_package {
    contain puppet_core_agent::repo
    contain puppet_core_agent::package

    Class['puppet_core_agent::repo']
    -> Class['puppet_core_agent::package']
  } else {
    contain puppet_core_agent::repo
  }
}
