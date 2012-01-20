# For Tribily Role - Adaptec Extended Monitoring 

class adaptec::monitoring::tribily {
  
  tribily::agent::userparams{ 'adaptec':
    file_src      => 'puppet:///adaptec/monitoring/tribily.conf',
  }

}
