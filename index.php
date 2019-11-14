<?php
session_start();
require_once('db.php');

$ro=new rocaObservation();
$array['a']=$ro->get_activity_codes();

$bID=$ro->build_request_variable('building');
$rID=$ro->build_request_variable('room_number');

if ((!empty($bID)) && (!empty($rID))) $array['r']=$ro->get_room_coordinates($bID.$rID);

$ro->close_connection();
/*
	echo '<pre>';
	print_r($array);
	echo '</pre>';
*/
?>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="ISO-8859-1">
	<title>ROCA Observation Tool</title>
	<link rel="stylesheet" href="assets/stylesheet.css">
	<link rel="stylesheet" href="assets/themify-icons.css">
   	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
		var grids = [<?php echo $array['r'] ?>];
	</script>
	<script type="text/javascript" src="script.js"></script>
</head>
<body onload="initConfig()">
	<!-- Data from forms set to invisible iframe: WILL NEED TO CHANGE THIS LATER -->
	<iframe name="dump_data_frame" id="dump_data_frame"></iframe>
	<div class="body_content">
		<!-- BEGIN: left_side div -->
		<!-- Contains classroom pic and majority of inputs -->
		<div id="left_side">
			<!-- BEGIN: top_left div -->
			<!-- Contains back button and room name -->
			<div id="top_left">
				<div class="grid">
						<div class="classroom_box">
							<a onclick="reload()" style=" vertical-align: middle"><span id="back_arrow" class="ti-arrow-left"></span></a>
							<span id = "classroom_name">Classroom Not Found</span>
						</div>
					<div class="alert_bar">
						<div class="col1">
							<div class="small" id="alert_activity"></div>
						</div>
						<div class="col2">
							<div class="small" id="alert_event"></div>
						</div>
						<div class="col3">
							<div class="small" id="alert_time"></div>
						</div>
				</div>
			</div>
			</div>
			<!-- BEGIN: classroom mapping -->
			<!-- This class needs to change based on which it is, probably most easy with JS, so correct picture is used. -->
			<div id="classroom_mapping">
				<div id="section_input">
					<table>
					<caption id="section_id" style="font-size: small; padding-top: 2%; background-color: white">Section</caption>
					<tr>
						<td rowspan="3"><span class='ti-user' style='vertical-align: -2px; font-size: 70%;'></span></td>
						<td><button class="circularButton2" title="Increment Students" type="button" id="more_students" onclick="updateCount(1)" style="font-weight: bold; font-size: 70%;">+</button></td>
						<td rowspan="3" id="section_events"></td>
					</tr>
					<tr>
						<td id="section_students" style="font-size: small;">0</td>
					</tr>
					<tr>
						<td><button class="circularButton2" title="Decrement Students" type="button" id="less_students" onclick="updateCount(-1)" style="font-weight: bold; font-size: 70%;">-</button></td>
					</tr>
					</table>
				</div>
			</div>
			<div class="bottom-row">
				<div id="bottom_left">		
					<div class="play-reset-btn">
						<div class="pen-wrapper" style="display: inline-block">
							<div class="buton-cover button-slide-out" id="active_div">
								<span class="button-slide-out__above" style="text-align: center" id="areYouSure">are you sure?</span>

								<div class="button-slide-out__middle">
									<button class="btn" id="start_button" onclick="start()" style="-webkit-animation: pulse 1.8s infinite" title="Start">
										<span class="ti-control-play" style="vertical-align: -2px"></span>
									</button>
								</div>

								<div class="button-slide-out__below">
									<button class="btn" id="cancelStop" onclick="stop()">cancel</button>
								</div>
							</div>
						</div>
						<div class="pen-wrapper" style="display: inline-block">

							<div class="buton-cover button-slide-out" id="reset_div">
								<span class="button-slide-out__above" style="text-align: center">are you sure?</span>

								<div class="button-slide-out__middle">
									<button class="btn" id="reset_button" onclick="confirmAction('reset_button', 'cancelReset', 'reset_div')" title="Reset">
										<div id="icon"><span class="ti-reload" style="vertical-align: -2px"></span></div>
									</button>
								</div>

								<div class="button-slide-out__below">
									<button class="btn" id="cancelReset" onclick="reload()">cancel</button>
								</div>

							</div>
						</div>
					</div>
					<!-- BEGIN: comment box div -->	
					<div class="comment_box">
						<input type="text" id="comment" placeholder="Enter Comment" autocomplete="off">
						<button id="submitComment" onclick="logData('comment')">
							<span class="ti-pencil"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END: left_side div -->
		<!-- BEGIN: right_side div -->
		<!-- Contains interval reading form -->
		<div id="right_side">
			<div class="dropdown">
			    <!-- trigger button -->
			    <button>Instructor Activity</button>
			    <!-- dropdown menu -->
				<ul class="dropdown-menu">
					<?php foreach ($array['a']['Instructor Activity'] as $a => $b) echo '<li><a title="'.$a.'" id="'.$a.'" onclick="logData('."'".$a."'".')">'.$b.'</a></li>'."\n"; ?>
				</ul>
			</div>
			<div class="dropdown">
			    <!-- trigger button -->
			    <button>Student Activity</button>
			    <!-- dropdown menu -->
			    <ul class="dropdown-menu">
					<?php foreach ($array['a']['Student Activity'] as $a => $b) echo '<li><a title="'.$a.'" id="'.$a.'" onclick="logData('."'".$a."'".')">'.$b.'</a></li>'."\n"; ?>
			    </ul>
			</div>
			<div id="event_dependencies">
				
			</div>
		</div>
		<!-- END: right_side div -->
	</div>
	<form id="finalSubmit" style = "display:none" action="collect.php" method="post">
  		<input type="hidden" name="fullData" id="fullData" value="">
        <input type="hidden" name="action" value="collect">
	</form>
</body>
</html>
