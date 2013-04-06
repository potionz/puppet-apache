package { 'httpd':
	ensure => installed,
	alias => apache

}
file { '/etc/httpd/conf/cgi.conf':
	ensure => present,
	mode => 0644,
	target => 'cgi.conf',	
	require => Package['httpd'],
}

service { 'httpd':
	enable => true,
	ensure => running,
	hasrestart => true,
	require => Package['httpd'],
}


