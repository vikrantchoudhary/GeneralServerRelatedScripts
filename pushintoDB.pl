#!/usr/bin/perl

# PERL MODULE WE WILL BE USING
use strict;
use Mysql;
use File::Glob ':globally';

# MySQL CONFIG VARIABLES
my $home = "\/home\/vikrant";
my $host = "10\.10\.10\.14\:3306";
#$host = "localhost";
my $database = "fay";
my $tablename = "LoginTracker_Local";
my $user = "buyme";
my $pw = "buyme\@2288";
system ("perl $home\/copyxls.pl");
sleep(3);
my $dbh = Mysql->connect($host, $database, $user, $pw) or die "unable to connect the DB$!";
my @sources = <$home\/*.csv>;
print @sources;
#my $query = "INSERT INTO LoginTracker\_Local \(TIMESTAMP,ERROR,Email,ReasonForFailure\) VALUES \(";
#print $query;
foreach (@sources) {
	my $sourcefile = $_;
	print "working with file $sourcefile \n";
	open(INFO, $sourcefile);		# Open the file
	while (<INFO>) {
		#print "$_ \n";
		my($timestamp,$error,$email,$ip,$reasonforfailure) = split(",",$_);
		my $query = "INSERT INTO LoginTracker\_Local \(TIMESTAMP,ERROR,Email,ReasonForFailure\) VALUES \(";

		#print $timestamp . $ip ."\n";
		$query .= "\'$timestamp\',\'$error\',\'$email\',\'$reasonforfailure\')";
		#print $query . "\n";
		my $sth = $dbh->query($query) or die "unable to run the query $!";
	}
	system("rm $sourcefile");
	#exit(0);
}
