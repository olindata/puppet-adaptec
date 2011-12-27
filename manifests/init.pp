class adaptec {

  file { "/opt/tribily/bin/adaptec_status.sh":
    ensure  => present,
    require => [File["/opt/tribily/bin"], Package["arcconf"]],
    source  => "puppet:///adaptec/adaptec_status.sh",
    owner  => "root", 
    group  => "root", 
    mode  => "0655",    
  }
  
  cron { "tribily-adaptec":
    command  => "sh /opt/tribily/bin/adaptec_status.sh > /dev/null 2>&1",
    user  => "root", 
    minute  => "*/4",
    require  => File["/opt/tribily/bin/adaptec_status.sh"],
  
  }


}
