class other {
  $packages = ["curl"]
  package { $packages:
    ensure => present,
  }
}
