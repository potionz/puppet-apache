$httpd = $operatingsystem ? {
	default => httpd
	}

package { $httpd:
	ensure => installed,
	alias => apache
}

service { $httpd:
	enable => true,
	ensure => running
}


