class brewcask {
  require homebrew

  exec { 'tap-homebrew-cask':
    command => 'brew tap phinze/homebrew-cask',
    creates => "${homebrew::config::installdir}/Library/Taps/phinze-cask"
  }

  package { 'brew-cask':
    require => Exec['tap-homebrew-cask']
  }
}
