# smart.pp

class adaptec::raid {
  
  include adaptec::params
  
  case $adaptec::params::monitoring {
    'tribily': { include adaptec::monitoring::tribily }
    false:     { notice "no monitoring for adaptec::raid" }
  }
  
  # Make sure the .deb is available locally on each server
  file { "/opt/oplexing/debs/arcconf_6.50.18570-1_amd64.deb":
    owner   => root,
    group   => root,
    mode    => 644,
    ensure  => present,
    require => File["/opt/oplexing/debs"],
    source  => "puppet:///adaptec/opt/oplexing/debs/arcconf_6.50.18570-1_amd64.deb"
  }

  # install prereqs for arcconf  and other stuff for the RAID array
  package { 
    ["libstdc++5"]: ensure => "present" 
  }

  # install Adaptec RAID controller software
  # arcconf package from http://hwraid.le-vert.net/wiki/DebianPackages
  # they have a repo, but it's unsigned so we use the deb directly
  package { "arcconf":
    provider => dpkg,
    ensure => latest,
    source => "/opt/oplexing/debs/arcconf_6.50.18570-1_amd64.deb",
    require => [File["/opt/oplexing/debs/arcconf_6.50.18570-1_amd64.deb"], Package["libstdc++5"]]
  } 

  # TODO
  # exec { "smartmon-enable":
  #       command => "/usr/bin/vim-addons -w install puppet; /usr/bin/vim-addons install puppet",
  #   unless  => "/usr/bin/vim-addons | grep puppet | grep installed"
  # }

  # require smart package
  package {"smartmontools":
    ensure => "present"
  }

}
