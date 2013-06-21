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
use JSON;

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
	
	pretty_print_json($client->ping());

} elsif ($command eq 'get_alert') {						# get_alert

	# Make sure we have an alert ID
	if(scalar @ARGV < 4) {
		
		print ("Please specify an alert ID");
		exit();
	}
	
	pretty_print_json($client->get_alert($ARGV[3]));

} elsif ($command eq 'get_device') {						# get_device

	# Make sure we have a device ID
	if(scalar @ARGV < 4) {
		
		print ("Please specify a device ID");
		exit();
	}
	
	pretty_print_json($client->get_device($ARGV[3]));

} elsif ($command eq 'get_locations') {						# get_locations

	# Make sure we have coords
	if(scalar @ARGV < 7) {
		
		print ("Please specify n,s,e,w coordinates");
		exit();
	}
	
	pretty_print_json($client->get_locations($ARGV[3], $ARGV[4], $ARGV[5], $ARGV[6]));
} else {

	print "Unknown command: $command\n";
	print $instructions;
	exit();
}



##
# Print pretty JSON
#
# @param content (hashref, data structure)
# @retval
sub pretty_print_json {

	my $content=shift;
	
	print(to_json($content, {utf8 => 1, pretty => 1})."\n");


}