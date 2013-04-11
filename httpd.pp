package { 'httpd':			# name of package which
	ensure => installed,		# ensure package is installed, if not puppet will install this package
	alias => apache,		
}
file { '/etc/httpd/conf/cgi.conf':	# set path and file name for cgi config
	notify => Service['httpd'],	# this will notify service httpd if config will be changed
	mode => 644,			# set permisions for cofing file
	owner => root,
	group => root,			# set owner and group of config file 
	content => template('/home/base/puppet/template/cgi.conf'),	# this is main cgi config file, all changes for cgi configuration must be done here in template and it also take effect in /etc/httpd/conf/cgi.conf!
	require => Package['httpd'],	# dependencies on installed package httpd
}
file { '/var/www/cgi-bin/index.pl':	# destination of cgi index file
	mode => 755,			# permisions of file
	owner => apache,		# owner of file
	group => apache,		# group of file
	content => template('/home/base/puppet/scripts/index.pl'),	# source file of cgi script, all changes for index.pl file must be done here in template and it also take effect on /var/www/cgi-bin/index.pl!
}	
service { 'httpd':			# select service httpd
	enable => true,			# enable service
	ensure => running,		# test if service is running
	hasrestart => true,		# set up that service will be restarted with init restart, not with stop /start script
	require => Package['httpd'],	# set up dependencies on package httpd
}
