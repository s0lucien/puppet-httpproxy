require 'spec_helper'

describe 'httpproxy' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge(:environment => 'test', :concat_basedir => '/var/lib/puppet/concat')
      end

      context 'with defaults' do
        it { is_expected.to compile.with_all_deps }

        it { is_expected.not_to contain_class('httpproxy::other::preseed') }
        it { is_expected.not_to contain_class('httpproxy::other::profiled') }
        it { is_expected.not_to contain_class('httpproxy::other::wget') }
        it { is_expected.not_to contain_class('httpproxy::other::packagemanager') }
        it { is_expected.not_to contain_class('httpproxy::other::apt') }
        it { is_expected.not_to contain_class('httpproxy::other::yum') }
      end

      context 'with all activated' do
        let(:params) do
          {
            :http_proxy      => 'proxy.test.com',
            :http_proxy_port => '80',
            :profiled        => true,
            :packagemanager  => true,
            :wget            => true,
            :preseed         => true
          }
        end
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('httpproxy::other::preseed') }
        it { is_expected.to contain_class('httpproxy::other::profiled') }
        it { is_expected.to contain_class('httpproxy::other::wget') }
        it { is_expected.to contain_class('httpproxy::other::packagemanager') }

        if facts[:osfamily] == 'Debian'
          it { is_expected.to contain_class('httpproxy::other::apt') }
        elsif facts[:osfamily] == 'RedHat'
          it { is_expected.to contain_class('httpproxy::other::yum') }
        end
      end
    end
  end
end
