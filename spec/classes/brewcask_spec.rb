require 'spec_helper'

describe 'brewcask' do
  let(:facts) { default_test_facts }

  it do
    should contain_homebrew__tap('caskroom/cask')
    should contain_package('brew-cask')
  end
end
