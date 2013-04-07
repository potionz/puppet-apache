package { 'httpd':
	ensure => installed,
	alias => apache

}
file { '/etc/httpd/conf/cgi.conf':
	notify => Service['httpd'],
	mode => 644,
	owner => root,
	group => root,
	content => template('/home/base/puppet/cgi.conf'),	
	require => Package['httpd'],
}

service { 'httpd':
	enable => true,
	ensure => running,
	hasrestart => true,
	require => Package['httpd'],
}



