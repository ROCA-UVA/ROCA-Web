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
	document.getElementById("classroom").innerHTML = building + " " + room_number;
}

function reload() {
	location.reload();
}

// Start recording
function start() {
	active = true;

	// Enable event buttons
	var inputs = document.getElementByTagName("INPUT");
	for (var i = 0; i < inputs.length; i++) {
		inputs[i].disabled = false;
	}

	// Change start button to stop button
	var start_button = document.getElementById("start_button");
	if (start_button.className == "pulse-button") {
		start_button.className = "circularButton";
		start_button.innerHTML = "<span class='ti-control-stop' style='vertical-align: -2px'></span>";
		start_button.style.backgroundColor = "red";
	}
}

// Stop recording
function stop() {
	active = false;

	// Display cancel button
	resetCancel();

	// Submit observation log to a form
	var log = document.getElementById("fullData");
	log.disabled = false;
	document.getElementById("finalSubmit").submit();
}

// Display cancel button and reset button
function resetCancel() {
	var cancel_button = document.getElementById("initiallyReset");
	var reset_button = document.getElementById("initiallyCancel");

	if (cancel_button.innerHTML != "cancel") {
		new_cancel = cancel_button;
		new_reset = reset_button;
	} else {
		new_cancel = reset_button;
		new_reset = cancel_button;
	}

	new_reset.style.backgroundColor = "#232323";
	new_reset.style.color = "#fff";
	new_reset.innerHTML = "<span class='ti-reload' style='vertical-align:-2px'></span>";

	new_cancel.style.backgroundColor = "#f1f1f1";
	new_cancel.style.color = "#000";
	new_cancel.innerHTML = "cancel";
}

function updateScroll() {
	var element = document.getElementByClassName("modal-body");
	element[0].scrollTop = element[0].scrollHeight;
}

function openFeed(event) {
	var modal = document.getElementById("feed");
	modal.style.display = "block";
	event.stopPropagation();
}
