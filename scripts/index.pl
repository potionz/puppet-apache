#!/usr/bin/perl
print "Content-type: text/html\n";

print <<"EOF123";
<HTML>
<head>
<title>
Perl
</title>
</head>
EOF123

print `uptime`;


exit;
 
