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

  $mytimestamp = inline_template("<%= Time.new.strftime('%Y%m%d_%H%M%S' %>")

	# Re-install new zabbix_agentd.conf
	#
  exec {  
    "install dns UserParams" :
      command =>
			"cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkup.$mytimestamp",
      path => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
  }


			#"cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkup.$::mytimestamp; sed -i '/^UserParameter=adpt./d' /etc/zabbix/zabbix_agentd.conf",

}
