# Add Userparams to Zabbix config
# Author: krish
# Organization: Tribily

define adaptec::addparams (
  $ensure = present
) {

  # Directory containing file parts
  $dir = "/etc/zabbix/conf.d"

	case $ensure {
		'present': {
			file { "/etc/zabbix/conf.d":
				ensure	=> directory,
				owner	=> "root",
				group	=> "root",
			}
		  file { "/etc/zabbix/conf.d/tribily_dns_userparams.erb":
		    ensure  => present,
		    source  => template("adaptec/userparams.erb"),
		    owner  => "root", 
		    group  => "root", 
		  }
		}
		'absent': {}
  }

}
