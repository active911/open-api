<?php
// Example postback server for Active911
//
// Remember, the alerts are WAITING ON US before being sent out!  This means that this script
// needs to do it's business and exit quickly and cleanly.
ob_start(); 

// Get POST data
$postback=json_decode($_POST['postback']);


// If this is a response action (someone pushed a response button), we don't care.  If this were a CAD integration too, you would do something at this point.
if($postback['type']!='alert') {

	json(array('result'=>'success', 'message'=>''));
	exit();
}

// Get the ID and title of the alert 
$alert_id=intval($postback['alert_id']);
$alert_title=$postback['alert_title'];

// Do something clever with this data


// Oops, we had an error (example)
//json(array('result'=>'error', 'message'=>"Sorry, we can't do that for alert $alert_id"));


// We want this user to get some external data.  Create external data and add a button to it 
$external_data=array();
array_push($external_data, array(
	"type"				=>	"internal",					// Open directly in app (preferred method)
	"url"				=> "http://www.fmcsa.dot.gov/facts-research/research-technology/visorcards/yellowcard.pdf",
	"title"				=>	"US DOT Yellowcard",
	"append_device_id"	=>	0							// Optionally append the ID of the current device, like: http://xyx.com => http://xyx.com#12345
	));


	
// Send data to server
json(array('result'=>'success', 'message'=>$external_data));

	




/**
 * JSON
 *
 * Send some data to the server and exit
 * @param some PHP arrays to be formatted as JSON text
 */
function json($data) {

	// Return this data to the Active911 server
	header("Content-type: application/json");
	print json_encode($data);
	ob_end_flush(); 
	exit();	
}	
?>