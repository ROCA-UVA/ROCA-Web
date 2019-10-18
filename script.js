// Global Variables
var building;
var room_number;
var active = false; // recording status

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
	start_button.style.backgroundColor = "red";
	start_button.setAttribute("onclick", "confirmAction('cancelStop', 'start_button')");
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
function confirmAction(cancel, action) {
	var cancel_button = document.getElementById(cancel);
	var action_button = document.getElementById(action);

	if (cancel_button.innerHTML != "cancel") {
		new_cancel = cancel_button;
		new_reset = action_button;
	} else {
		new_cancel = action_button;
		new_reset = cancel_button;
	}

	new_reset.style.backgroundColor = new_cancel.style.backgroundColor;
	new_reset.style.color = new_cancel.style.color;
	new_reset.innerHTML = new_cancel.innerHTML;

	new_cancel.style.backgroundColor = "#f1f1f1";
	new_cancel.style.color = "#000";
	new_cancel.innerHTML = "cancel";
}

function updateScroll() {
	var element = document.getElementByClassName("modal-body");
	element[0].scrollTop = element[0].scrollHeight;
}
