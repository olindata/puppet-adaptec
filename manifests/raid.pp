# smart.pp

class adaptec::raid {

  include adaptec::params

  case $adaptec::params::monitoring {
    'tribily': { include adaptec::monitoring::tribily }
    false:     { notice 'no monitoring for adaptec::raid' }
  }

  # ensure that the kernel module to monitor the hard drives is loaded
  kern_module { 'sg':
    ensure => present
 }

  # install Adaptec RAID controller software
  # arcconf package from http://hwraid.le-vert.net/wiki/DebianPackages
  # they have a repo, but it's unsigned so we use the deb directly
  include apt::repo::hwraid_le_vert

  package { 'arcconf':
    ensure  => latest,
    require => Apt::Repo::Hwraid_le_vert
  }

  # TODO
  # exec { "smartmon-enable":
  # }

  # require smart package
  package {'smartmontools':
    ensure => 'present'
  }

}
