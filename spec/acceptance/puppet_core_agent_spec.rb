# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'Puppet Core Agent' do
  forge_api_key = ENV['FORGE_API_KEY']

  before(:all) do
    skip('Set FORGE_API_KEY to run acceptance tests that install the puppet-agent package') if forge_api_key.nil?
  end

  let(:pp) do
    <<-MANIFEST
      class { 'puppet_core_agent':
        forge_api_key  => Sensitive('#{forge_api_key}'),
        manage_package => true,
        version        => '8.20.0',
      }
    MANIFEST
  end

  it 'applies idempotently' do
    idempotent_apply(pp)
  end

  describe command('/opt/puppetlabs/bin/puppet --version') do
    its(:stdout) { is_expected.to match(%r{^8\.20\.0$}) }
  end
end
