package { 'httpd':
	ensure => installed,
	alias => apache

}
file { '/etc/httpd/conf/cgi.conf':
	ensure => link,
	target => '/home/base/puppet/cgi.conf',	
	require => Package['httpd'],
}

service { 'httpd':
	enable => true,
	ensure => running,
	hasrestart => true,
	require => Package['httpd'],
}


