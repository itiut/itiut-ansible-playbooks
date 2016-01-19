require 'spec_helper'

BREW_TAPS_DIR = '/usr/local/Library/Taps/'
CASK_PACKAGES_DIR = '/opt/homebrew-cask/Caskroom/'

vars = load_variables

vars['brew_taps'].each do |tap|
  user, repo = tap.split('/')
  tap_with_prefix = [user, 'homebrew-' + repo].join('/')
  describe file(BREW_TAPS_DIR + tap_with_prefix) do
    it { should be_directory }
  end
end

vars['brew_packages'].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

vars['cask_packages'].each do |package|
  describe file(CASK_PACKAGES_DIR + package) do
    it { should be_directory }
  end
end
