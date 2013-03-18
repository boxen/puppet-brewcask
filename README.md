puppet-brewcask
===============

A module which installs homebrew-cask, and a brewcask provider for Puppet's package type.

## Requirements

Currently assumes a boxen-based environment, and requires puppet-homebrew.

## Usage

```puppet
include brewcask # taps homebrew-cask / installs brew-cask

# now you can install packages using homebrew-cask
package { 'adium': provider => 'brewcask' }
package { 'firefox': provider => 'brewcask' }
```

## Work in progress

Please contribute by reporting issues and submitting pull requests!
