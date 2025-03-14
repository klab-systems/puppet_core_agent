# @summary Configures Puppet Core repository and optionally manages the agent install
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
  if $manage_package {
    contain puppet_core_agent::repo
    contain puppet_core_agent::package

    Class['puppet_core_agent::repo']
    -> Class['puppet_core_agent::package']
  } else {
    contain puppet_core_agent::repo
  }
}
