require 'spec_helper'

describe 'brewcask' do
  let(:facts) { default_test_facts }

  it do
    should contain_class('homebrew')
    should contain_homebrew__tap('caskroom/cask')
  end

  it do
    should contain_file('/test/custom/homebrew-cask').with_ensure('directory')
    should contain_file('/test/custom/homebrew-cask/Caskroom').with_ensure('directory')
  end

  it do
    should contain_boxen__env_script('brewcask').with_ensure('present')
  end
end
