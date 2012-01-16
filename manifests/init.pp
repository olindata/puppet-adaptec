class adaptec {

#  file { "/opt/tribily/bin/adaptec_status.sh":
#    ensure  => present,
#    require => [File["/opt/tribily/bin"], Package["arcconf"]],
#    source  => "puppet:///adaptec/adaptec_status.sh",
#    owner  => "root", 
#    group  => "root", 
#    mode  => "0655",    
#  }

#	# CronJob for Monitoring
#	#  
#  cron { "tribily-adaptec":
#    command  => "sh /opt/tribily/bin/adaptec_status.sh > /dev/null 2>&1",
#    user  => "root", 
#    minute  => "*/4",
#    require  => File["/opt/tribily/bin/adaptec_status.sh"],
#		ensure	=> absent,
#  }

#	# For config backup datetime
#  $mytimestamp = inline_template("<%= Time.new.strftime('%Y%m%d_%H%M%S') %>")
#
#	# Backup old zabbix_agentd.conf and clean current with any UserParam modification for adpt
#	#
#  exec {  
#    "Backing up existing tribily agent configuration":
#      command =>
#			"cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkup.$mytimestamp; sed -i '/^UserParameter=adpt./d' /etc/zabbix/zabbix_agentd.conf",
#			unless	=> "grep -i 'Tribily Role - Adaptec Extended Monitoring' /etc/zabbix/zabbix_agentd.conf",
#      path => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
#  }
#
#
#	# Add new user Params
#	addparams {
#		"install dns Userparams":
#			ensure	=> present,
#			file	=>	"/etc/zabbix/zabbix_agentd.conf",
#	}


}
