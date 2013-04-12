package {'perl':			# check if perl package is installed
	ensure => installed,		# and if not then it will install it
}
package {'perl-CGI':			# check if perl-CGI is installed
	ensure => installed,		# 
	require => Package['perl'],	# and set dependencies that perl package is required
}

