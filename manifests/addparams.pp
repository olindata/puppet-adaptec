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
		  file { "/etc/zabbix/conf.d/tribily_dns_userparams":
		    ensure  => present,
		    content  => template("adaptec/userparams.erb"),
		    owner  => "root", 
		    group  => "root", 
		  }
		# ensure that the zabbix-agent reloads
		# Enable below code if service zabbix-agent is not defined elsewhere in your puppet code	 	
#		  service { "zabbix-agent":
#		    enable      => true,
#		    ensure      => "running",
#		    status      => "/etc/init.d/zabbix-agent status",
#		    hasrestart  => true,
#		    hasstatus   => false,
#		    subscribe   => File["/etc/zabbix/conf.d/tribily_dns_userparams"], 
#			}
		# If you do, then this work around for reload agent works. If you have a restart call in zabbix-agent
			exec {
				"Refreshing Zabbix Agent":
					command	=> "/etc/init.d/zabbix-agent restart",
					subscribe	=> File["/etc/zabbix/conf.d/tribily_dns_userparams"],
					refreshonly	=> true,
					path => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
			}
		}
		'absent': {}
  }
}
