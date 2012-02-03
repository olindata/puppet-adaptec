class adaptec::params {

  $monitoring = $::adaptec_monitoring ? {
    ''      => false,
    default => $::adaptec_monitoring
  }

}
