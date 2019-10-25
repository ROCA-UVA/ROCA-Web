<?php
class rocaObservation extends collabConnection
{
	public $listData=array();
	protected $conn;

	public function __construct()
	{
//		$this->bind_session();
		$this->data_connection();
	}

	protected function data_connection()
	{
		$this->conn=mysqli_connect("dbm2.itc.virginia.edu", "DOTs", "Vb5YDh4m00!hjtNY7*^", "ROCA");
		if (!$this->conn) {
			echo "Error: Unable to connect to MySQL." . PHP_EOL;
			echo "Debugging error: " . mysqli_connect_errno() . PHP_EOL;
			echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
			exit;
		}
	}

	protected function safe_data_entry($_val, $_type) 
	{
		switch ($_type) {
			case "text":
				$_val=(!empty($_val)) ? "'".$this->format_data_text($_val)."'" : "NULL";
				break;
			case "html_text":
				$_val=(!empty($_val)) ? "'".$this->format_html_text($_val)."'" : "NULL";
				break;
			case "int":
				$_val=((!empty($_val)) && (is_numeric($_val))) ? intval($_val) : "0";
				break;
			case "double":
				$_val=(!empty($_val)) ? "'".doubleval($_val)."'" : "0";
				break;
			case "date":
				$_val = ($_val != "") ? "'" . $_val . "'" : "NULL";
				break;
		}

		return $_val;
	}

	protected function format_data_text($_val)
	{
		$_val=str_replace("\'", "&#39;", $_val);
		$_val=str_replace('\"', "&quot;", $_val);
		$_val=str_replace("'", "&#39;", $_val);
		$_val=str_replace('"', "&quot;", $_val);
	
		$search=array('@<script[^>]*?>.*?</script>@si','@<style[^>]*?>.*?</style>@siU','@<[\/\!]*?[^<>]*?>@si','@<![\s\S]*?--[ \t\n\r]*>@');
		$_val=preg_replace($search, '', $_val);
		$_val=str_replace('<', '&lt', $_val);
		$_val=str_replace('>', '&gt', $_val);
	
		$_val=$this->format_html_text($_val);
	
		return $_val;
	}
	
	protected function format_html_text($_val)
	{
		$_val=str_replace("'", "&#39;", $_val);
		$_val=str_replace('‘', "&lsquo;", $_val);
		$_val=str_replace('’', "&rsquo;", $_val);
		$_val=str_replace('—', "&ndash;", $_val);
		$_val=str_replace('“', "&ldquo;", $_val);
		$_val=str_replace('”', "&rdquo;", $_val);
	
		return $_val;
	}

	public function build_request_variable($request, $isNumeric=0)
	{
		$return=(isset($_GET[$request])) ? $_GET[$request] : '';

		if (empty($return)) $return=(isset($_POST[$request])) ? $_POST[$request] : '';
		if (!empty($isNumeric)) $return=(is_numeric($return)) ? $return : 0;
	
		return $return;
	}

	public function close_connection()
	{
		$this->conn->close();
	}

	public function get_observation_data()
	{
		$this->get_activity_codes();
		$this->get_event_codes();
		$this->get_dependencies();
		$this->get_room_coordinates();

		return $this->listData;
	}
	
	public function get_activity_codes()
	{
		$sSQL="SELECT C.category, S.subcategory, A.ID, A.name";
		$sSQL .=" FROM (categories C INNER JOIN subcategories S ON C.ID=S.cID)";
		$sSQL .=" INNER JOIN activities_code_bank A ON S.ID=A.scID";
		$sSQL .=" ORDER BY S.cID, A.ID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $this->listData[$row['category']][$row['subcategory']][$row['ID']]=$row['name'];
		
		foreach($this->listData as $a => $b) if ($a=='Activity') foreach($b as $c => $d) $return[$c]=$d;
		return $return;
	}

	public function get_event_codes($list='')
	{
		$sSQL="SELECT C.category, S.subcategory, E.ID, E.name";
		$sSQL .=" FROM (categories C INNER JOIN subcategories S ON C.ID=S.cID)";
		$sSQL .=" INNER JOIN events_code_bank E ON S.ID=E.scID";
		if (!empty($list)) $sSQL .=" WHERE E.ID IN (".$list.")";
		$sSQL .=" ORDER BY S.cID, E.ID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $this->listData[$row['category']][$row['subcategory']][$row['ID']]=$row['name'];

		if (!empty($list)) {
			foreach($this->listData as $a => $b) if (($a!='Activity') && ($a!='Dependencies')) foreach($b as $c => $d) foreach($d as $e => $f) $return[$c][$a][$e]=$f;
			return $return;	
		}
	}

	public function get_dependencies($aID='')
	{
		$sSQL="SELECT aID, eID FROM dependencies";
		if (!empty($aID)) $sSQL .=" WHERE aID='".$aID."'";
		$sSQL .=" ORDER BY aID, eID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $this->listData['Dependencies'][$row['aID']][]=$row['eID'];

		if (!empty($aID)) return implode(",", $this->listData['Dependencies'][$aID]);	
	}

	public function get_room_coordinates($rn='')
	{
		$sSQL="SELECT R.roomName, RC.sP, RC.eP, RC.sID FROM room_coordinates RC INNER JOIN room R ON R.ID-RC.rID";
		if (!empty($rn)) $sSQL .=" WHERE R.roomName='".$rn."'";
		$sSQL .=" ORDER BY R.roomName, RC.sID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $this->listData['Coordinates'][$row['roomName']][$row['sID']]=$row['sP'].','.$row['eP'];

		if (!empty($rn)) {
			foreach($this->listData['Coordinates'][$rn] as $a => $b) $return[$a]=$b;
			return $return;
		}
	}
}

class collabConnection
{
	protected function bind_session()
	{
		$context=new BLTI("L1f30nGrndzIsc00l", false, false);
		if ($context->valid) {
			$_SESSION['bind']=array(
				'eid' => $_POST['context_id'],
				'uid' => $_POST['ext_sakai_eid'],
				'fn' => $_POST['lis_person_name_given'],
				'ln' => $_POST['lis_person_name_family'],
				'uc' => $_POST['user_id'],
				'role' => $_POST['ext_sakai_role']
			);
		} else if (!isset($_SESSION['bind'])) {
			$this->display_error('The Collab Tool you are trying to connect to is no longer available. Please try and refresh the page, or contact us at <a href="mailto:seas-dats@virginia.edu" style="color: #0033CC; text-decoration: none;">seas-dats@virginia.edu</a> if you are still receiving this error so we may assist you.');
		}
	}
}
?>