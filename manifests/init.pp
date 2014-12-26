# Public: Install and configure brewcask for use with Boxen.
#
# Examples
#
#   include brewcask

class brewcask {
  require homebrew

  $cask_home = $::brewcask_root
  $cask_room = "${cask_home}/Caskroom"

  homebrew::tap { 'caskroom/cask': }

  file { $cask_home:
    ensure => directory
  }

  # This prevents typing root password the first time a cask is installed
  file { $cask_room:
    ensure  => directory,
    before  => Package['brew-cask'],
    require => File[$cask_home]
  }

  package { 'brew-cask':
    require  => Homebrew::Tap['caskroom/cask'],
    provider => homebrew
  }

  boxen::env_script { 'brewcask':
    content  => template('brewcask/env.sh.erb'),
    priority => highest,
  }

  Package['brew-cask'] -> Package <| provider == brewcask |>
}
