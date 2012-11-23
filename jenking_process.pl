#!/usr/bin/perl -w
use strict;
use POSIX qw/strftime/;

=head
	This script to follow the deployment process 
	Author: vikrant choudhary
	Date : 06-sept-2012
=cut

print "process started at " . strftime('%D %T',localtime) . "\n";
print "============== stopping the servers ========= \n";
my $stop_cmd = "//bin//sh //etc//init\.d//tomcat6\-fay\.sh stop";
my $ssh_cmd = "ssh root\@server ";
system ($ssh_cmd . $stop_cmd);

print "==== delete the old build  === \n";
my $remove_cmd = "rm -rf //home//tomcat6//instances//tomcat6\-fay//webapps//ROOT ";
system ($ssh_cmd . $remove_cmd);

print "==== copy the war from the jenking machine ==\n";

print "=============== copy started =============" . strftime('%D %T',localtime) . "\n";
my $copy_cmd = "//usr//bin//scp ROOT\_main\.war root\@server//home//tomcat6//instances//tomcat6\-fay//webapps";

print "running the command ... " . $copy_cmd ."\n";
system ($copy_cmd);
print "copy done " . strftime('%D %T',localtime) . "\n";

print "process started at " . strftime('%D %T',localtime) . "\n";
print "============== start the servers ========= \n";
my $start_cmd = "//bin//sh //etc//init\.d//tomcat6\-fay\.sh start";
system ($ssh_cmd . $stop_cmd);
print "start completed " . strftime('%D %T',localtime) . "\n";




