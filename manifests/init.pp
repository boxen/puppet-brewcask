class brewcask {
  require homebrew

  homebrew::tap { 'caskroom/homebrew-cask': }

  package { 'brew-cask':
    require => Homebrew::Tap['caskroom/homebrew-cask']
  }
}
