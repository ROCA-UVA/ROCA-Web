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
			echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
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

	public function get_activity_codes()
	{
		$sSQL="SELECT S.scName, A.aName, A.aCode";
		$sSQL .=" FROM (bank_categories C INNER JOIN bank_sub_categories S ON C.ID=S.catID)";
		$sSQL .=" INNER JOIN bank_code_activities A ON S.ID=A.scID";
		$sSQL .=" WHERE C.catName='Activity'";
		$sSQL .=" ORDER BY S.catID, A.ID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $return[$row['scName']][$row['aCode']]=$row['aName'];

		return $return;
	}

	public function get_zone_codes($aID)
	{
		$sSQL="SELECT scID FROM bank_code_activities WHERE aCode='".$aID."' LIMIT 1";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $sID=$row['scID'];
		$scID=($sID==1) ? 8 : 9;
		
		$sSQL="SELECT eName, eCode FROM bank_code_events WHERE scID='".$scID."' ORDER BY ID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $return[$row['eCode']]=$row['eName'];

		return $return;
	}

	public function get_dependencies($aID)
	{
		$sSQL="SELECT D.eID ";
		$sSQL .=" FROM bank_dependencies D INNER JOIN bank_code_activities A ON A.ID=D.aID";
		$sSQL .=" WHERE A.aCode='".$aID."' ORDER BY aID, eID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $array[]=$row['eID'];

		$list=implode(",", $array);	
		return $this->get_event_codes($list);
	}

	public function get_event_codes($list)
	{
		$sSQL="SELECT C.catName, S.scName, E.eName, E.eCode";
		$sSQL .=" FROM (bank_categories C INNER JOIN bank_sub_categories S ON C.ID=S.catID)";
		$sSQL .=" INNER JOIN bank_code_events E ON S.ID=E.scID";
		$sSQL .=" WHERE (C.catName='Instantaneous Event' OR C.catName='Durational Event') AND E.ID IN (".$list.")";
		$sSQL .=" ORDER BY S.catID, E.ID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $return[$row['scName']][$row['catName']][$row['eCode']]=$row['eName'];

		return $return;
	}

	public function get_room_coordinates($rn)
	{
		$sSQL="SELECT Z.zID, Z.rCord FROM room_zones Z INNER JOIN room R ON R.ID=Z.rID WHERE R.rName='".$rn."' ORDER BY Z.ID";
		$build_query=$this->conn->query($sSQL);
		while($row=mysqli_fetch_array($build_query)) $array[$row['zID']]='['.$row['rCord'].']';
		$return=implode(",", $array);	

		return $return;
	}

	public function create_collection($console)
	{
		$iSQL="INSERT INTO 'collection' ('oID', 'cID', 'sTime', 'eTime', 'temp') VALUES ('1', '3', '0', '0', '".$console."')";
		mysqli_query($this->conn, $iSQL);
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
