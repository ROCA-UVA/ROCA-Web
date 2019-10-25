<?php
require_once('db.php');
$ro=new rocaObservation();
/*
// Get ALL Observational Datasets
$array=$ro->get_observation_data();
$string=implode(",", $array);
*/
// Get Individual Data
$array['a']=$ro->get_activity_codes();
// If you have the current activity, just return a list of dependency IDs
$aID=$ro->build_request_variable('aid', 1);
$dList=$ro->get_dependencies($aID);
// If you have the dependencies, just return a list of Events
$array['e']=$ro->get_event_codes($dList);
// If you have the room, just return it's coordinates
$rn='THNE316';
$array['r']=$ro->get_room_coordinates($rn);
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
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				<div>
					<a onclick="reload()" style=" vertical-align: middle"><span id="back_arrow" class="ti-arrow-left"></span></a>
					<span id = "classroom_name">Classroom Not Found</span>
				</div>
			</div>
			<!-- BEGIN: classroom mapping -->
			<!-- This class needs to change based on which it is, probably most easy with JS, so correct picture is used. -->
			<div id="classroom_mapping">
			</div>

			<div id="bottom_left">
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
		</div>
		<!-- END: left_side div -->

		<!-- BEGIN: right_side div -->
		<!-- Contains interval reading form -->
		<div id="right_side">
			<div id="interval_readings_form">
				<div id="Pedagogical_Strategies">
					<div class="dropdown">
					<button class="side-button">instructor activities</button>
					<div class="dropdown-content">
                    	<?php foreach($array['a']['Instructor Activity'] as $a => $b) echo '<a href="">'.$b.'</a>'."\n"; ?>
					</div>
					<br>
				</div>
				<div class="dropdown" onmouseover="reactivateDropdowns()">
					<button class="side-button">student activities</button>
					<div class="dropdown-content">
						<?php foreach($array['a']['Student Activity'] as $a => $b) echo '<a href="">'.$b.'</a>'."\n"; ?>
					</div>
				</div>

					<div id="timer" style="text-align: center;"></div>
					<div class="subheader">What is the instructor doing?</div>
					<div class="checkbox-grid">
                    	<?php 
							foreach($array['e']['Instructor Event'] as $a => $b) {
								$type=($a=='Instantaneous Event') ? 'circular-side-button' : 'pulse-side-button';
								foreach($b as $c => $d) echo '<button class="'.$type.'" title="'.$d.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
							}
						?>
					</div>
				</div>
				<div id="Instructional Technologies">
					<div class="subheader">What technologies are being used?</div>
					<div class="checkbox-grid">
                    	<?php 
							foreach($array['e']['Student Event'] as $a => $b) {
								$type=($a=='Instantaneous Event') ? 'circular-side-button' : 'pulse-side-button';
								foreach($b as $c => $d) echo '<button class="'.$type.'" title="'.$d.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
							}
						?>
					</div>
				</div>
				<div id="Student Engagement">
					<div class="subheader">What are the students doing?</div>
					<div class="checkbox-grid">
                    	<?php 
							foreach($array['e']['Technology'] as $a => $b) {
								$type=($a=='Instantaneous Event') ? 'circular-side-button' : 'pulse-side-button';
								foreach($b as $c => $d) echo '<button class="'.$type.'" title="'.$d.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
							}
						?>
					</div>
				</div>
			</div>
		</div>
		<!-- END: right_side div -->
	</div>

	<form id="finalSubmit" style="display:none" action="db.php" method="post">
		<input type="hidden" name="fullData" id="fullData" value="">
	</form>

</body>
</html>
