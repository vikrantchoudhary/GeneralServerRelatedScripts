#/usr/bin/perl -w 

use POSIX qw(strftime);
$now_string = strftime "%a_%b%e%Y_%H%M", localtime;

my $SCPCOMMAND="\/usr\/bin\/scp \-i \/home\/vikrant\/test2\.pem ";
my $remote_servers = "server name";
my @remotes = split (',',$remote_servers);
my $i=0;
foreach  (@remotes) {
	print "copying the file from the $remotes[$i]  \n";
	my $COMMAND = $SCPCOMMAND . "root\@$remotes[$i]:\/home\/tomcat6\/instances\/tomcat6-fay\/logs\/fay\-login\-logs\.csv \/home\/vikrant\/fay\-login\-logs\.$remotes[$i]\.$now_string\.csv";
	print $COMMAND ."\n";
	system($COMMAND);
	$i++;

}
