# Add Userparams to Zabbix config
# Author: krish
# Organization: Tribily

define addparams (
  $ensure = present,
  $file
) {

  # Is config available
  if defined(File[$file]) {
    debug("Found Zabbix agent configuration ${file}.")
  } else {
    file {$file:
      debug("Zabbix agent configuration file ${file} not found.")
    }
  }

  # Directory containing file parts
  $dir = "/etc/zabbix/"

  file { "/etc/zabbix/zabbixDNSuserparams":
    ensure  => present,
    source  => template("adaptec/UserParams.erb"),
    owner  => "root", 
    group  => "root", 
  }
	

  case $ensure {
		'present': {
    	exec { "UserParam Configuration":
      	command => "cat /etc/zabbix/zabbixDNSuserparams >> ${file}",
      	refreshonly => true,
      	subscribe => File[$dir],
      	before => File[$file],
    	}
		'absent': {}
  }

}
