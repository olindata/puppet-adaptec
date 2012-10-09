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
  include s_apt::hwraid

  package { 'arcconf':
    ensure  => latest,
    require => Class['s_apt::hwraid']
  }

  # TODO
  # exec { "smartmon-enable":
  # }

  # require smart package
  package {'smartmontools':
    ensure => 'present'
  }

}
