#!/usr/bin/perl
my $instructions=qq(

# client.pl
#
# Perl client example for the Active911 open API
#
# Usage: client.pl <app_key> <api_key> <command> [parameters]
#
# Server output is dumped to the screen using Dumper
#
);

use lib qw(../../lib);
use Active911;
use Data::Dumper;

# Check for params
if(scalar @ARGV < 3) {

	print $instructions;
	exit();
}

my ($app_key, $api_key, $command)=@ARGV;
$command=lc($command);

# Create a client
my $client= new Active911($app_key, $api_key);

# Run the command
if($command eq 'ping') {									# ping
	
	print Dumper($client->ping());

} elsif ($command eq 'fetch_alert') {						# get_alert

	# Make sure we have an alert ID
	if(scalar @ARGV < 4) {
		
		print ("Please specify an alert ID");
		exit();
	}
	
	print Dumper($client->fetch_alert($ARGV[3]));

} elsif ($command eq 'fetch_device') {						# get_device

	# Make sure we have a device ID
	if(scalar @ARGV < 4) {
		
		print ("Please specify a device ID");
		exit();
	}
	
	print Dumper($client->fetch_device($ARGV[3]));


} else {

	print "Unknown command: $command\n";
	print $instructions;
	exit();
}
