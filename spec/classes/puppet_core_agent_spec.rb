# frozen_string_literal: true

require 'spec_helper'

describe 'puppet_core_agent' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { { 'forge_api_key' => 'MYFORGEAPIKEY', 'manage_package' => true, 'version' => '8.11.0' } }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
