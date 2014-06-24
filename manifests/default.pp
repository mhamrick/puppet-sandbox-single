# default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

include bootstrap 
include other

class { '::mysql::server':
  old_root_password => '',
  root_password     => 'claspass',
  override_options  => { 'mysqld'  => { 'max_connections' => '101' } }
 }
  
class { 'apache':
 mpm_module => 'prefork', 
}
class { '::apache::mod::php': }

