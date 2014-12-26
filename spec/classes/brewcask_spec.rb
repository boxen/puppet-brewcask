require 'spec_helper'

describe 'brewcask' do
  let(:facts) { default_test_facts }

  it do
    should include_class('homebrew')

    should contain_homebrew__tap('caskroom/cask')

    should contain_file('/opt/homebrew-cask').with_ensure('directory')
    should contain_file('/opt/homebrew-cask/Caskroom').with_ensure('directory')

    should contain_package('brew-cask').with_provider('homebrew')
  end
end
