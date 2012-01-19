# For Tribily Role - Adaptec Extended Monitoring 

# UserParameter =adpt.conmod,/opt/tribily/bin/adaptec_status.sh adpt.conmod
# UserParameter =adpt.temp,/opt/tribily/bin/adaptec_status.sh adpt.temp
# UserParameter =adpt.ldevon,/opt/tribily/bin/adaptec_status.sh adpt.ldevon
# UserParameter =adpt.ldevfail,/opt/tribily/bin/adaptec_status.sh adpt.ldevfail
# UserParameter =adpt.ldevdeg,/opt/tribily/bin/adaptec_status.sh adpt.ldevdeg
# UserParameter =adpt.bios,/opt/tribily/bin/adaptec_status.sh adpt.bios
# UserParameter =adpt.firm,/opt/tribily/bin/adaptec_status.sh adpt.firm
# UserParameter=adpt.driver,/opt/tribily/bin/adaptec_status.sh adpt.driver
# UserParameter=adpt.flash,/opt/tribily/bin/adaptec_status.sh adpt.flash
# UserParameter=adpt.battery,/opt/tribily/bin/adaptec_status.sh adpt.battery
# UserParameter=adpt.raidlevel,/opt/tribily/bin/adaptec_status.sh adpt.raidlevel
# UserParameter=adpt.raidsize,/opt/tribily/bin/adaptec_status.sh adpt.raidsize
# UserParameter=adpt.1state,/opt/tribily/bin/adaptec_status.sh adpt.1state
# UserParameter=adpt.1power,/opt/tribily/bin/adaptec_status.sh adpt.1power
# UserParameter=adpt.1smart,/opt/tribily/bin/adaptec_status.sh adpt.1smart
# UserParameter=adpt.2state,/opt/tribily/bin/adaptec_status.sh adpt.2state
# UserParameter=adpt.2power,/opt/tribily/bin/adaptec_status.sh adpt.2power
# UserParameter=adpt.2smart,/opt/tribily/bin/adaptec_status.sh adpt.2smart
# UserParameter=adpt.tribily.ver,/opt/tribily/bin/adaptec_status.sh adpt.tribily.ver

class adaptec::monitoring::tribily {
  
  tribily::agent::userparam{ 'adpt.tribily.ver':
    file      => 'adaptec.conf',
    userparam => 'adpt.tribily.ver,/opt/tribily/bin/adaptec_status.sh adpt.tribily.ver',
  }

}
