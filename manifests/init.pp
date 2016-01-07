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
    require => File[$cask_home]
  }

  boxen::env_script { 'brewcask':
    content  => template('brewcask/env.sh.erb'),
    priority => highest,
  }
}
