<?php
class dataConnection
{
    public $conn;

	public function __construct()
	{
		$this->tDate=mktime(0, 0, 0, date('n'), date('j'), date('Y'));
		$this->cTime=mktime(date('G'), date('i'), 0, 1, 1, 2000);
		$this->pTime=mktime(date('G'), date('i'), date('s'), 1, 1, 2000);
//		$this->data_connection();
	}

    public function data_connection()
    {
        $link = mysqli_connect("dbm2.itc.virginia.edu", "DOTs", "Vb5YDh4m00!hjtNY7*^", "DOTs");
		if (!$link) {
			echo "Error: Unable to connect to MySQL." . PHP_EOL;
			echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
			echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
			exit;
		} else {
			echo "Success: A proper connection to MySQL was made! The my_db database is great." . PHP_EOL;
			echo "Host information: " . mysqli_get_host_info($link) . PHP_EOL;	
		}
    }

    // used just to pass safe data to database
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
    // used just to pass clean data to database
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
    // used just to pass clean data to database
    /*protected function format_html_text($_val)
    {
        $_val=str_replace("'", "&#39;", $_val);
        $_val=str_replace(''', "&lsquo;", $_val);
                                $_val=str_replace(''', "&rsquo;", $_val);
        $_val=str_replace('-', "&ndash;", $_val);
        $_val=str_replace('"', "&ldquo;", $_val);
        $_val=str_replace('"', "&rdquo;", $_val);
        
        return $_val;
    }*/
    
    public function close_connection()
    {
        $this->conn->close();
    }
}

if(isset($_POST['function'])) {
    if($_POST['function'] == 'getDependencies') {
        getDependencies($_POST['ID']);
    }
}

function getfromcodebank($cID, $sectionID)
{
	$array[1]=array(
		'L' => 'Lecturing',
		'LW' => 'Lecturing While Writing',
		'LVIS' => 'Lecturing from Pre-Made Visuals',
		'LDEM' => 'Lecturing with Demonstration',
		'AT' => 'Administrative Task',
		'CQ' => 'Clicker Question',
		'MM' => 'Multimedia',
		'ID' => 'Idle'
	);
	$array[2]=array(
		'SGW' => 'Small Group Work',
		'GD' => 'Group Discussion',
		'SP' => 'Student Presentation',
		'DW' => 'Deskwork'
	);
	$array[3]=array(
		'IDQ' => 'Poses a Question',
		'IRQ' => 'Rhetorical Question',
		'ICQ' => 'Comprehension Question',
		'FUp' => 'Provides Feedback'
	);
	$array[4]=array(
		'SQ' => 'Asks a Question',
		'SR' => 'Response to Instructor',
		'WC' => 'Response to Student',
		'PrD' => 'Makes Prediction'
	);
	$array[5]=array(
		'WP' => 'Working Out Problems',
		'W' => 'Writing',
		'HUM' => 'Humor',
		'ANEX' => 'Anecdote / Example',
		'ORG' => 'Organization',
		'EMP' => 'Emphasis',
		'IND' => 'Individualized Instruction',
		'MT' => 'Monitoring',
		'MG' => 'Guiding Student Work'
	);
	$array[6]=array(
		'PI' => 'Peer Interactions',
		'IT' => 'Individual Thinking',
		'TN' => 'Taking Notes'
	);
	$array[7]=array(
		'CB' => 'Chalkboard / Whiteboard',
		'DP' => 'Digital Projector',
		'PP' => 'Presentation',
		'M' => 'Multimedia',
		'DT' => 'Digital Display',
		'WEB' => 'Website'
	);
    if($cID == 4){
        echo "<table style='width:auto; height:auto;'>
                       <caption style='font-size: 40%; padding-top: 2%'>" . $sectionID . "</caption>
                       <tr>
                       <td rowspan='3'><span class='ti-user' style='vertical-align: -2px; font-size: 50%;'></span></td>
                       <td><button class='circularButton2' title='Increment Students' type='button' id='more_students' onclick='updateStudentNum(this," . $sectionID . ")' style='font-weight: bold; font-size: 70%;'>+</button></td>
                       <td rowspan='3'>";
        
		foreach ($array[$cID] as $a => $b) echo "<button class='button2 event " .$a. "'style='width:100%' onclick='dataToFeed(event,this," . $sectionID . ")'>" .$b. "</button>";
        echo " </td>
                        </tr>
                        <tr>
                        <td id='numStudentLabel" . $sectionID . "' style='font-size: small;'>0</td>
                        </tr>
                        <tr>
                        <td><button class='circularButton2' title='Decrement Students' type='button' id='less_students' onclick='updateStudentNum(this," . $sectionID . ")' style='font-weight: bold; font-size: 70%;'>-</button></td>
                        </tr>
                        </table>";
    } else {
		if($cID ==1 || $cID==2){
			foreach ($array[$cID] as $a => $b) echo "<a class='code activity' id = ".$a
                            . " onclick='dataToFeed(event, this, null);'>" 
                            . $b . "</a>";
		} else if($cID==3){
			foreach ($array[$cID] as $a => $b) echo "<a class='event' id = ". $a
                    . " onclick='dataToFeed(event, this, null);'>"
                        . $b . "</a>";
		} else {
			foreach ($array[$cID] as $a => $b) echo "<label class='container' title='" . $b . "'>
    								<input type='checkbox' id='" . $a . "'onclick='dataToFeed(event, this, null)'>" . $a .
    								"</input><span class='checkmark'></span></label>";
		}
	}
}

function getDependencies($ID){
//    $dc = new dataConnection;
//    $dc->data_connection();

    $dArray = array();
    $query="SELECT C.dC FROM roca_code_bank C WHERE C.cID IN (3,4,5,6) AND C.isVS=1";
//    $result = mysqli_query($dc->conn, $query);
 //   while($row = mysqli_fetch_array($result)) array_push($dArray, $row['dC']);
 
    $query = "SELECT T.ID, T.cID, T.bID, T.dID, (C.ID), (C.dC)
              FROM
        		(SELECT A.ID, A.cID, A.dC, B.bID, B.dID
                    FROM (`roca_code_bank` AS A) INNER JOIN (`roca_code_dependencies` AS B)
                    ON A.ID = B.bID
                    WHERE A.dC = '".$ID."') AS T
              INNER JOIN (`roca_code_bank` AS C)
              ON T.dID = C.ID";
 //   $result = mysqli_query($dc->conn, $query);
//    while($row = mysqli_fetch_array($result)) if (($key = array_search($row['dC'], $dArray)) != false) unset($dArray[$key]);
	$trueArray = array_values($dArray);

    $obj = (object) array(
        'active' => $ID,
        'anArray' => $trueArray
    );

//    $dc->close_connection();
    echo json_encode($obj);
}

// Check if a sub menu exists for a main menu component
function subMenuExists($ID, $result){
    /*while($row = mysqli_fetch_array($result)){
        if($row['eXT'] == $ID){
            return True;
        }
    }*/
    return False;
}
// Get the components of the sub menu
function getSubMenu($ID, $result){
    while($row = mysqli_fetch_array($result)){
        if($row['eXT'] == $ID){
            echo "<a onclick='dataToFeed(event, this);hideSubmenu(\"submenu" . $ID . "\");'>" . $row['dN'] . "</a>";
        } 
    }
    
}
 ?>