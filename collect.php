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
				$_return .='						<button class="'.$class.'" title="'.$d.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
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
				$_return .='						<button class="'.$class.'" title="'.$d.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
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
				$_return .='						<button class="'.$class.'" title="'.$d.'" type="button" id="'.$c.'_button" onclick="logData('."'".$c."_button'".')">'.$d.'</button>'."\n";
			}
		}
		$_return .='					</div>'."\n";
		$_return .='				</div>'."\n";
		
		echo $_return;
		break;
	case "zone_update":
		$array=$ro->get_zone_codes($code);

//		$_return .='						<td rowspan="3">'."\n";
		foreach ($array as $a => $b) $_return .='						<button class="pop_up_button" title="'.$b.'" id="'.$a.'_button" onclick="logData('."'".$a."_button'".')">'.$b.'</button><br>'."\n"; 
		
		echo $_return;
		break;
	case "collect":
		$log=$ro->build_request_variable('fullData');
		$uID=$ro->build_request_variable('uID');
		$cID=$ro->build_request_variable('cID');
		$temp=(explode("|", $log));
		foreach ($temp as $a => $b) $search[]=(explode("*", $b));
		foreach ($search as $a => $b) {
			if ($b[0]=="Observation Started") $array['start']=array('date' => $b[1], 'time' => strtotime($b[1].' '.$b[2]));
			if ($b[0]=="Observation Ended") $array['end']=array('date' => $b[1], 'time' => strtotime($b[1].' '.$b[2]));
		}
		foreach ($search as $a => $b) {
			if (substr_count($b[0] ,"Section")>=1) {
				$t=(explode("=", $b[0]));
				$s=strtotime($array['start']['date'].' '.$b[2]);
				if ($s<=$array['start']['time']) {
					$array['attendance']['start'][$t[1]]=$array['attendance']['start'][$t[1]]+$b[1];
				} else {
					$array['attendance']['during'][$t[1]][strtotime($array['start']['date'].' '.$b[2])]=$b[1];
				}
			} else if ($b[0]=="Comment") {
				$array['comment'][strtotime($array['start']['date'].' '.$b[2])]=$b[1];
			} else if ($b[0]=="Activity Start") {
				 $array['activity'][strtotime($array['start']['date'].' '.$b[2])]['start']=$b[1];
				 foreach ($array['event']['duration'][$act] as $c => $d) if (!isset($d['end'])) $array['event']['duration'][$act][$c]['end']=strtotime($array['start']['date'].' '.$b[2]);
				 if (!empty($act)) $array['activity'][$act]['end']=strtotime($array['start']['date'].' '.$b[2]);
				 $act=strtotime($array['start']['date'].' '.$b[2]);
			} else if ($b[0]=="Instant Event") {
				$t=(explode("=", $b[1]));
				$array['event']['instant'][$act][str_replace('_button', '' ,$t[0])][$t[1]]=strtotime($array['start']['date'].' '.$b[2]);
			} else if ($b[0]=="Duration Event Start") {
				$array['event']['duration'][$act][str_replace('_button', '' ,$b[1])]['start']=strtotime($array['start']['date'].' '.$b[2]);
			} else if ($b[0]=="Duration Event End") {
				$array['event']['duration'][$act][str_replace('_button', '' ,$b[1])]['end']=strtotime($array['start']['date'].' '.$b[2]);
			}
		}
		$ro->create_collection($uID, $cID, $array);
		header('Location: index.php?action=s');
		break;
}
$ro->close_connection();
?>