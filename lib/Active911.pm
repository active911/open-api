
package Active911;

use strict;
use Exporter;
use JSON;
use LWP::UserAgent;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);


$VERSION     = 0.1;
@ISA         = qw(Exporter);
@EXPORT      = qw();

##
# New object
#
# @param app_key The app key for this app
# @param api_key The API key from the account we are trying to access
# @retval ourself
sub new {

	my ($class, $app_key, $api_key)=@_;
	my $self={
	
		_app_key	=>	$app_key,
		_api_key	=>	$api_key
	};
	
	bless $self, $class;
	
	return $self;
}


## 
# server_command
#
# Perform an operation on the server. 
#
# @param data (hashref)
# @retval server response (hashref, like {'result'=>'success', 'message'=>['whatever', 43, 'whatever']})
sub server_command {

	my ($self, $data)=@_;

	# Set up a basic request
	my $params={
	
		app_key	=>	$self->{'_app_key'},
		api_key	=>	$self->{'_api_key'}
	};
	
	# Extend with passed data
	foreach my $key (keys %{$data}) {
		
		$params->{$key}=$data->{$key};
	}
				
	# Send the request
	my $ua=LWP::UserAgent->new();
	my $response=$ua->post('https://access.active911.com/interface/open_api.php', $params);

	# Success?
	if($response->is_success) {
	
		# Yes. Decode the server JSON
		my $content=$response->decoded_content();
		my $json;
		eval {
		
			$json=from_json($content, {utf8 => 1});
			
		} or do {

			return {"result" => "error", "message" => "Invalid JSON received from server"};
		};
		
		return $json;
	}

	# No. Return error.
	return {"result" => "error", "message" => "Error reaching server: ".$response->status_line };
}


## 
# Ping
#
# If the server likes our keys, it will respond with 'pong'
#
# @retval server response (hashref, like {'result'=>'success', 'message'=>'pong'})
sub ping {

	my $self=shift;

	return server_command($self,{ operation => 'ping' });
	
}


## 
# Fetch an alert
#
# Fetch an alert from the server
#
# @param alert_id the ID of the alert 
# @retval server response (hashref, like {'result'=>'success', 'message'=>{ alert data... }})
sub fetch_alert {

	my $self=shift;
	my $alert_id = int shift;
	
	return server_command($self,{ operation => 'fetch_alert', alert_id => $alert_id });
	
}

## 
# Fetch a device
#
# Gets information on a particular device
#
# @param device_id the ID of the device
# @retval server response (hashref, like {'result'=>'success', 'message'=>{ data... }})
sub fetch_device {

	my $self=shift;
	my $device_id = int shift;
	
	return server_command($self,{ operation => 'fetch_device', device_id => $device_id });
	
}


1;