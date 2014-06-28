require "puppet/provider/package"

Puppet::Type.type(:package).provide :brewcask,
  :parent => Puppet::Provider::Package do

  confine  :operatingsystem => :darwin

  has_feature :versionable
  has_feature :install_options

  # no caching, thank you
  def self.instances
    []
  end

  def self.home
    "#{Facter[:boxen_home].value}/homebrew"
  end

  def self.caskroom
    "/opt/homebrew-cask/Caskroom/"
  end

  def self.run(*cmds)
    command = ["sudo", "-E", "-u", Facter[:luser].value, "#{home}/bin/brew", "cask", *cmds].flatten.join(' ')
    output = `#{command}`
    unless $? == 0
      fail "Failed running #{command}"
    end

    output
  end

  def self.current(name)
    caskdir = Pathname.new "#{caskroom}/#{name}"
    caskdir.directory? && caskdir.children.size >= 1 && caskdir.children.sort.last.to_s
  end

  def query
    return unless version = self.class.current(resource[:name])
    { :ensure => version, :name => resource[:name] }
  end

  def install
    run "install", resource[:name], *install_options
  end

  def uninstall
    run "uninstall", resource[:name]
  end

  def install_options
    Array(resource[:install_options]).flatten.compact
  end

  def run(*cmds)
    self.class.run(*cmds)
  end
end
