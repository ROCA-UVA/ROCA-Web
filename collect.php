<?php
require_once('db.php');
$ro=new rocaObservation();
$action=$ro->build_request_variable('action');
$code=$ro->build_request_variable('code');

switch ($action) {
	case "event_update":
		$array=$ro->get_dependencies($code);

		$_return='				<div id="Instructor Engagement">'."\n";
		$_return .='					<div class="subheader">What is the Instructor Doing?</div>'."\n";
		$_return .='					<div class="checkbox-grid">'."\n";
		foreach ($array['Instructor Event'] as $a => $b) {
			foreach ($b as $c => $d) {
				$class=($a=='Durational Event') ? 'pulse-side-button' : 'circular-side-button';
				$_return .='						<button class="'.$class.'" title="'.$c.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
			}
		}
		$_return .='					</div>'."\n";
		$_return .='				</div>'."\n";
		$_return .='				<div id="Student Engagement">'."\n";
		$_return .='					<div class="subheader">What are the Students Doing?</div>'."\n";
		$_return .='					<div class="checkbox-grid">'."\n";
		foreach ($array['Student Event'] as $a => $b) {
			foreach ($b as $c => $d) {
				$class=($a=='Durational Event') ? 'pulse-side-button' : 'circular-side-button';
				$_return .='						<button class="'.$class.'" title="'.$c.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
			}
		}
		$_return .='					</div>'."\n";
		$_return .='				</div>'."\n";
		$_return .='				<div id="Instructional Technologies">'."\n";
		$_return .='					<div class="subheader">What Technologies are Being Used?</div>'."\n";
		$_return .='					<div class="checkbox-grid">'."\n";
		foreach ($array['Technology'] as $a => $b) {
			foreach ($b as $c => $d) {
				$class=($a=='Durational Event') ? 'pulse-side-button' : 'circular-side-button';
				$_return .='						<button class="'.$class.'" title="'.$c.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
			}
		}
		$_return .='					</div>'."\n";
		$_return .='				</div>'."\n";
		
		echo $_return;
		break;
	case "zone_update":
		$array=$ro->get_zone_codes($code);

		$_return .='						<td rowspan="3">'."\n";
		foreach ($array as $a => $b) $_return .='						<button class="pop_up_button" title="'.$a.'" id="'.$a.'_button"  onclick="logData('."'".$a."_button'".')">'.$b.'</button>'."\n"; 

		echo $_return;
		break;
	case "collect":
		$log=$ro->build_request_variable('fullData');
		echo $log.'<br>';
		
		
		
		//$ro->create_collection($log);

		break;
}
$ro->close_connection();
?>
