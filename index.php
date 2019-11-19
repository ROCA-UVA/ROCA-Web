<?php
session_start();
//require_once('../ims-blti/blti.php');
require_once('db.php');


$ro=new rocaObservation();
//$ro->bind_session();
$collected=$ro->build_request_variable('action');
$array=$ro->get_class_list();
/*
echo '<pre>';
print_r($array);
echo '</pre>';
*/
$ro->close_connection();
?>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="ISO-8859-1">
	<title>ROCA Observation Tool</title>
	<link rel="stylesheet" href="assets/stylesheet.css">
	<link rel="stylesheet" href="assets/themify-icons.css">
</head>
<body>
Welcome to ROCA Testing!!!
<br>
<?php if (!empty($collected)) echo '<b>Your Observation has been successfully collected!!</b><br>'; ?>
What Class would you like to observe?
<ul>
<?php foreach ($array as $a => $b) echo '<li style="padding: 3px;"><a style="text-decoration: none; color: black" href="obs.php?r='.$b['rID'].'&c='.$a.'">'.$b['display'].'</a></li>'."\n"; ?>
</ul>
</body>
</html>