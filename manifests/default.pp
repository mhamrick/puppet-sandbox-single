# default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

include bootstrap 
include other

class { '::mysql::server':
  old_root_password => '',
  root_password     => 'password',
  override_options  => { 'mysqld'  => { 'max_connections' => '101' } }
 }

mysql::db { 'one':
  user      => 'one',
  password  => 'one',
  host      => 'localhost',
  grant     => ['SELECT', 'UPDATE','CREATE','DROP','DELETE','GRANT','ALTER'],
}

mysql::db { 'two':
  user      => 'two',
  password  => 'two',
  host      => 'localhost',
  grant     => ['SELECT', 'UPDATE','CREATE','DROP','DELETE','GRANT','ALTER'],
}
 
class { 'apache':
 mpm_module => 'prefork', 
}
class { '::apache::mod::php': }

apache::vhost { 'one.example.com':
  port            => '80',
  docroot       => '/var/www/one',
}

apache::vhost { 'two.example.com':
  port            => '80',
  docroot       => '/var/www/two',
}
