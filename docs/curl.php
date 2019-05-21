<?php

// set IP address and API access key
$ip = '161.185.160.93';
$access_key = 'YOUR_ACCESS_KEY';

// Initialize CURL:
$ch = curl_init('http://api.ipapi.com/'.$ip.'?access_key='.$access_key.'');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true

// Store the data:
$json = curl_exec($ch);
curl_close($ch);

// Decode JSON response:
$api_result = json_decode($json, true);

// Output the "calling_code" object inside "location"
echo $api_result['location']['calling_code'];
