file {'motd':
	path => '/etc/motd',
	ensure => present,
	mode => 0644,
	content => "fedora
edited on server
puppet",

}

