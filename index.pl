#!/usr/bin/perl

print "Content-type: text/html\n\n";

print "<HTML>";
print "<HEAD>";
print "<TITLE>Hello World</TITLE>";
print "</HEAD>";
print "<BODY>";
print "<H1>Fedora</H1>";
print "</BODY>";
print "</HTML>";

print `uptime`;

exit;
 
