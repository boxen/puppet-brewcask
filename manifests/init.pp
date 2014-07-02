class brewcask {
  require homebrew

  # caskroom is hardcoded to '/opt/homebrew-cask/Caskroom'
  # https://github.com/caskroom/homebrew-cask/blob/master/lib/cask/locations.rb#L11
  $cask_home = "/opt/homebrew-cask"
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
    require => Homebrew::Tap['caskroom/cask']
  }

  Package['brew-cask'] -> Package <| provider == brewcask |>
}
