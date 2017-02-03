class brewcask {
  include boxen::config
  require homebrew

  file { "${boxen::config::envdir}/10_brewcask.sh":
    ensure => 'absent'
  }
}
