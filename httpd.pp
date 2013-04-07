package { 'httpd':
	ensure => installed,
	alias => apache,

}
file { '/etc/httpd/conf/cgi.conf':
	notify => Service['httpd'],
	mode => 644,
	owner => root,
	group => root,
	content => template('/home/base/puppet/template/cgi.conf'),	
	require => Package['httpd'],
}
file { '/var/www/cgi-bin/index.pl':
	mode => 755,
	owner => apache,
	group => apache,
	content => template('/home/base/puppet/scripts/index.pl'),
}	
service { 'httpd':
	enable => true,
	ensure => running,
	hasrestart => true,
	require => Package['httpd'],
}



