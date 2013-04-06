$httpd = $operatingsystem ? {
	default => httpd
	}

package { $httpd:
	ensure => installed,
	alias => apache
}
file { '/etc/httpd/conf/cgi.conf':
	path => '/etc/httpd/conf/',
	ensure => present,
	contetn => "LoadModule cgi_module modules/mod_cgi.so",
}


service { $httpd:
	enable => true,
	ensure => running,
	hasrestart => true,
	require => Package['httpd'],	
}


