// Global Variables
var building;
var room_number;
var active = false; // recording status
var grids = [[1, 6, 8, 8], [1, 1, 13, 6], [8, 6, 13, 7], [13, 6, 18, 7], [13, 1, 26, 6], [18, 6, 26, 8]];
var section_count = [];

// Return current date (month/date/year)
function getDate() {
	var timestamp = new Date();
	var month = timestamp.getMonth();
	month = parseInt(month)+1;
	return month+"/"+timestamp.getDate()+"/"+timestamp.getFullYear();
}

// Return current time (hrs:min:sec)
function getTime() {
	var timestamp = new Date();
	var min = timestamp.getMinutes();
	var sec = timestamp.getSeconds();
	if(min < "10") {
		min = "0" + min;
	}
	if(sec < "10") {
		sec = "0" + sec;
	}
	return timestamp.getHours()+":"+min+":"+sec;
}

function initConfig() {
	// Get URL parameters and set building/room number variables
	var url = window.location.search.substring(1);
	var url_params = url.split('&');
	for (var i = 0; i < url_params.length; i++) {
		var param = url_params[i].split('=');
		if (param[0] == "building") {
			building = param[1];
		} else if (param[0] == "room_number") {
			room_number = param[1];
		}
	}

	// Update title of live observation page
	if (building != undefined && room_number != undefined) {
		document.getElementById("classroom_name").innerHTML = building + " " + room_number;
	}

	// Display corresponding classroom image
	var image_path = "url(assets/images/".concat(building, "-", room_number, ".jpg)");
	document.getElementById("classroom_mapping").style.backgroundImage = image_path;

	// Display section grids
	for (var i = 0; i < grids.length; i++) {
		createGrid(grids[i][0], grids[i][1], grids[i][2], grids[i][3], i+1);
		section_count.push(0);
	}
}

function reload() {
	location.reload();
}

// Start recording
function start() {
	active = true;

	// Enable event buttons
	var inputs = document.getElementsByTagName("INPUT");
	for (var i = 0; i < inputs.length; i++) {
		inputs[i].disabled = false;
	}

	// Change start button to stop button
	var start_button = document.getElementById("start_button");
	start_button.innerHTML = "<span class='ti-control-stop' style='vertical-align: -2px'></span>";
	start_button.setAttribute("style", "background-color: red");
	start_button.setAttribute("onclick", "confirmAction('start_button', 'cancelStop', 'active_div')");
	start_button.title = "Stop";

	// Print date and time when observation is started
	console.log("Observation started on "+getDate()+" at "+getTime());
	document.getElementById("alert_event").innerHTML = "Observation started on "+getDate()+" at "+getTime();
}


// Stop recording
function stop() {
	active = false;

	// Submit observation log to a form
	var log = document.getElementById("fullData");
	log.disabled = false;
	document.getElementById("finalSubmit").submit();
}

// Display cancel button and action button
function confirmAction(action, cancel, div_id) {
	var cancel_button = document.getElementById(action);
	var action_button = document.getElementById(cancel);
	var button_div = document.getElementById(div_id);

	if (cancel_button.innerHTML != "cancel") {
		new_cancel = cancel_button;
		new_action = action_button;
		button_div.classList.add("is_active");
	} else {
		new_cancel = action_button;
		new_action = cancel_button;
		button_div.classList.remove("is_active");
	}

	new_action.style.backgroundColor = new_cancel.style.backgroundColor;
	new_action.style.color = new_cancel.style.color;
	new_action.innerHTML = new_cancel.innerHTML;
	new_action.title = new_cancel.title;

	new_cancel.style.backgroundColor = "#f1f1f1";
	new_cancel.style.color = "#000";
	new_cancel.innerHTML = "cancel";
	new_cancel.title = "Cancel";
}

// Print time and action when event button is pressed
function logData(id) {
	if (active) {
		var element = document.getElementById(id);
		var alert_activity = document.getElementById("alert_activity");
		var alert_event = document.getElementById("alert_event");
		if (element.className == "pulse-side-button") {
			if (element.style.backgroundColor == "red") {
				console.log("["+getTime()+"] End of event: "+element.title);
				alert_event.innerHTML = "["+getTime()+"] End of event: "+element.title;
				element.setAttribute("style", "background-color: black");
			} else {
				console.log("["+getTime()+"] Start of event: "+element.title);
				alert_event.innerHTML = "["+getTime()+"] Start of event: "+element.title;
				element.setAttribute("style", "background-color: red");
			}
		} else if (element.nodeName == "INPUT") {
			console.log("["+getTime()+"] Comment: "+element.value);
			alert_event.innerHTML = "["+getTime()+"] Comment: "+element.value;
			element.value = "";
		} else if (element.nodeName == "A") {
			console.log("["+getTime()+"] Activity: "+element.innerHTML);
			alert_activity.innerHTML = element.innerHTML;
			alert_event.innerHTML = "["+getTime()+"] Activity: "+element.innerHTML;
		} else {
			console.log("["+getTime()+"] Event: "+element.title);
			alert_event.innerHTML = "["+getTime()+"] Event: "+element.title;
		}
	}
}

// Creates grids for classroom sections
function createGrid(x1, y1, x2, y2, section) {
	var frame = document.getElementById("classroom_mapping");
	var height = y2 - y1;
	var width = x2 - x1;
	var x = x1 + 2;
	var y = 10 - (height + y1);
	var new_grid = document.createElement("DIV");

	new_grid.id = "section_" + section;
	new_grid.style.backgroundColor = "rgba(98,86, 80, 0.5)";
	new_grid.style.border = "solid";
	new_grid.style.gridRow= y + " / span " + height;
	new_grid.style.gridColumn = x + " / span " + width;

	new_grid.onclick = function() {displaySection(section)};

	frame.appendChild(new_grid);
}

// Display corresponding classroom section
function displaySection(section) {
	input = document.getElementById("section_input");
	id = document.getElementById("section_id");
	students = document.getElementById("section_students");
	if (input.style.display == "none" || id.innerHTML.substring(9) != section) {
		var x = event.clientX;
		var y = event.clientY;
		input.style.left = x+'px';
		input.style.top = y+'px';
		
		input.style.display = "block";
		id.innerHTML = "Section: " + section;
		students.innerHTML = section_count[section-1];
	} else if (id.innerHTML.substring(9) == section) {
		input.style.display = "none";
	}
}

// Update student count total
function updateCount(num) {
	section = document.getElementById("section_id").innerHTML.substring(9);
	students = document.getElementById("section_students");
	
	count = section_count[section-1] += num;	
	students.innerHTML = count;
	console.log("["+getTime()+"] Event: "+count+" student(s) in section "+section);
	document.getElementById("alert_event").innerHTML = "["+getTime()+"] Event: "+count+" student(s) in section "+section;
}
