Homebrew Cask Puppet Module for Boxen [![Build Status](https://travis-ci.org/boxen/puppet-brewcask.svg)](https://travis-ci.org/boxen/puppet-brewcask)
=====================================

A module which installs [homebrew-cask](https://github.com/caskroom/homebrew-cask), and `brewcask` provider for Puppet's `package` type.

## Usage

```puppet
include brewcask # taps homebrew-cask / installs brew-cask

# now you can install packages using homebrew-cask
package { 'adium': provider => 'brewcask' }
package { 'firefox': provider => 'brewcask' }
```

## Custom facts

 - `brewcask_root` (only overridable from `$BOXEN_REPO_DIR/facts.d/`)
   - default is `/opt/homebrew-cask`

## Required Puppet Modules

 - `homebrew`, >= 1.10.0

## Work in progress

Please contribute by reporting issues and submitting pull requests!
