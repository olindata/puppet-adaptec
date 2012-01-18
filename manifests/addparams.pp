# Add Userparams to Zabbix config
# Author: krish
# Organization: Tribily

define adaptec::addparams (
  $ensure = present
) {

	case $ensure {
		'present': {
			file { "/etc/zabbix/conf.d":
				ensure	=> directory,
				owner	=> "root",
				group	=> "root",
			}
		  file { "/etc/zabbix/conf.d/tribily_dns_userparams.erb":
		    ensure  => present,
		    content  => template("adaptec/userparams.erb"),
		    owner  => "root", 
		    group  => "root", 
		  }
		 # ensure that the zabbix-agent reloads
		  service { "zabbix-agent":
		    enable      => true,
		    ensure      => "running",
		    status      => "/etc/init.d/zabbix-agent status",
		    hasrestart  => true,
		    hasstatus   => false,
		    subscribe   => File["/etc/zabbix/conf.d/tribily_dns_userparams.erb"], 
			}
		}
		'absent': {}
  }
}
