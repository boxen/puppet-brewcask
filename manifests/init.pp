class brewcask {
  require homebrew

  homebrew::tap { 'phinze/homebrew-cask': }

  package { 'brew-cask':
    require => Homebrew::Tap['phinze/homebrew-cask']
  }
}
