# For Tribily Role - Adaptec Extended Monitoring 

class adaptec::monitoring::tribily {
  
  tribily::agent::userparams{ 'adaptec':
    source      => 'puppet:///adaptec/monitoring/tribily.conf',
  }

}
