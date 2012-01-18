class adaptec {

  file { "/opt/tribily/bin/adaptec_status.sh":
    ensure  => present,
    require => [File["/opt/tribily/bin"], Package["arcconf"]],
    source  => "puppet:///adaptec/adaptec_status.sh",
    owner  => "root", 
    group  => "root", 
    mode  => "0655",    
  }

	# For config backup datetime 
  $mytimestamp = inline_template("<%= Time.new.strftime('%Y%m%d_%H%M%S') %>")

	# Backup old zabbix_agentd.conf
	#
  exec {  
    "Backing up existing tribily agent configuration":
      command =>
			"cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bkup.$mytimestamp",
			onlyif	=> "grep -i 'Tribily Role - Adaptec Extended Monitoring' /etc/zabbix/zabbix_agentd.conf",
      path => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
  }

 # Clean current with any UserParam modification for adpt and old Include conf dir
  exec {  
    "Cleaning old Adaptec config":
      command =>
			"sed -i '/^UserParameter=adpt./d' /etc/zabbix/zabbix_agentd.conf",
			onlyif	=> "grep -i 'Tribily Role - Adaptec Extended Monitoring' /etc/zabbix/zabbix_agentd.conf",
      path => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
			require	=> Exec["Backing up existing tribily agent configuration"],
  }


 # Warn New Include conf dir
  exec {  
    "Including additional Userparameter configuration":
      command =>
			"echo 'INFO: Please use Include=/etc/zabbix/conf.d instead of `grep 'Include=' /etc/zabbix/zabbix_agentd.conf` in Zabbix Agent configuration.",
			unless	=> "grep 'Include=/etc/zabbix/conf.d/' /etc/zabbix/zabbix_agentd.conf",
      path => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
			require	=> Exec["Cleaning old Adaptec config"],
  }


	# Add new user Params
	adaptec::addparams {
		"install dns Userparams":
			ensure	=> present,
			require => Exec["Cleaning old Adaptec config"],
	}

}
