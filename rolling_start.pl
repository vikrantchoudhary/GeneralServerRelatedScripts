#!/usr/bin/perl
use strict;
use warnings;
use POSIX qw/strftime/;

my $remote_servers = "server1,server2";
my @remotes = split (',',$remote_servers);
my $i =0;
my $stop_cmd = ' sh /etc/init.d/tomcat6-fay.sh stop';
my $start_cmd = ' sh /etc/init.d/tomcat6-fay.sh start';
my $status_cmd = ' sh /etc/init.d/tomcat6-fay.sh status';
foreach  (@remotes) {
	    #Make sure the server is off" ;
		print "Stopping server: ", $remotes[$i] ,strftime('%D %T',localtime) ,"  \n";
		my $ssh_cmd = "//usr//bin//ssh vikrant\@" . $remotes[$i], " ";
		system ($ssh_cmd . $stop_cmd);
		print "checking the status .. ";
		system ($ssh_cmd . $status_cmd);

		print "Starting server: ", $remotes[$i] ,strftime('%D %T',localtime) , "\n";
		system ($ssh_cmd . $start_cmd);

		$i++;
}
