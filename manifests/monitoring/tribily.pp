# For Tribily Role - Adaptec Extended Monitoring 

class adaptec::monitoring::tribily {
  
  tribily::agent::userparams{ 'adaptec':
    source      => 'puppet:///adaptec/monitoring/tribily.conf',
  }

  file { '/opt/tribily/bin/adaptec_status.sh':
    ensure => present,
    source => 'puppet:///adaptec/opt/tribily/adaptec_status.sh',
  }

}
