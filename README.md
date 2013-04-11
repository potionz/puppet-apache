puppet-apache
=============

Puppet recipe that installs, configures and starts Apache HTTP server with CGI

## Features ##

Puppet recipe which install Apache httpd serice and load cgi module. 
For cgi scripts is used cgi.conf file which is in template/cgi.conf.
This configuration file will be copy into /etc/httpd/conf/cgi.conf,
and must be edited only in template/cgi.conf.
Also there is example test perl scripts/index.pl which show us some system info,
this file is copied into /var/www/cgi-bin/index.pl.

## Requirements: ##
Generally, you need the following things installed:

* puppet 2.7.21 or higher
* Ruby 1.8.7, and 1.9.3 are fully supported.
* Ruby OpenSSL library.

## Usage: ##

You can start installation with:

*puppet apply main.pp*

it will automaticly run httpd.pp and perl.pp manifests.

