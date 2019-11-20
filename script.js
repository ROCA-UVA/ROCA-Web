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

// Return current time (hrs:min)
function getTime() {
	var timestamp = new Date();
	var min = timestamp.getMinutes();
	if(min < "10") {
		min = "0" + min;
	}
	return timestamp.getHours()+":"+min;
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


		// Video
		var video = document.getElementById("student_video");
		var video2 = document.getElementById("slides_video");
		var video3 = document.getElementById("instructor_video");
		// Buttons
		var playButton = document.getElementById("play-pause");
		var playIcon = document.getElementById("play")
		var muteButton = document.getElementById("mute");
		
		var toggle = document.getElementById("toggle");
		// Sliders
		var seekBar = document.getElementById("seek-bar");
		var volumeBar = document.getElementById("volume-bar");
	
	
	
		var currentlyPlaying = 1;
	
		
	
		myVar = setInterval(setTime, 500);
		toggle.addEventListener("click",function() {
			
			 
		if (currentlyPlaying === 1) {
			document.getElementById("slides_video").id = 'xxxxxx';
			 document.getElementById("instructor_video").id ="slides_video";
			 document.getElementById("xxxxxx").id = 'instructor_video';
			currentlyPlaying = 2;
		 
		} else {
			document.getElementById("instructor_video").id = 'xxxxxx';
			 document.getElementById("slides_video").id ="instructor_video";
			 document.getElementById("xxxxxx").id = 'slides_video';
			currentlyPlaying = 1;
		   
		}
	
			
				
		
		}
			
	
	
			);
	
		// Event listener for the play/pause button
		playButton.addEventListener("click", function() {
			if (video.paused == true) {
				// Play the video
				video.play();
				video2.play();
				video3.play();
				playIcon.className = "ti-control-stop"
				// Update the button text to 'Pause'
				
			} else {
				// Pause the video
				video.pause();
				video2.pause();
				video3.pause();
				playIcon.className = "ti-control-play"
				// Update the button text to 'Play'
				
			}
		});
	
	
		// Event listener for the mute button
		muteButton.addEventListener("click", function() {
			if (video.muted == false) {
				// Mute the video
				video.muted = true;
				video2.muted = true;
				video3.muted= true;
				// Update the button text
				muteButton.innerHTML = "Unmute";
			} else {
				// Unmute the video
				video.muted = false;
				video2.muted=false;
				video3.muted=false;
				// Update the button text
				muteButton.innerHTML = "Mute";
			}
		});
	
	
	
	
	
		// Event listener for the seek bar
		seekBar.addEventListener("change", function() {
			// Calculate the new time
			var time = video.duration * (seekBar.value / 100);
	
			// Update the video time
			video.pause();
			video2.pause();
			video3.pause();
			playIcon.className = "ti-control-play"
			video.currentTime = time;
			video2.currentTime=time;
			video3.currentTime=time;
		});
	
		
		// Update the seek bar as the video plays
		video3.addEventListener("timeupdate", function() {
			// Calculate the slider value
			var value = (100 / video3.duration) * video3.currentTime;
	
			// Update the slider value
			seekBar.value = value;
		});
	
	
	
		// Event listener for the volume bar
		volumeBar.addEventListener("change", function() {
			// Update the video volume
			video.volume = volumeBar.value;
			video3.volume = volumeBar.value;
			video2.volume = volumeBar.value;
		});
	
		function setTime(){
			var time = video3.currentTime;
	
			 document.getElementById("time").innerHTML= new Date(time * 1000).toISOString().substr(11, 8);
	
		}
	
	
	
	
	var offset = [0,0];
	var divOverlay = document.getElementById ("overlay");
	var isDown = false;
	divOverlay.addEventListener('mousedown', function(e) {
		isDown = true;
		offset = [
			divOverlay.offsetLeft - e.clientX,
			divOverlay.offsetTop - e.clientY
		];
	}, true);
	document.addEventListener('mouseup', function() {
		isDown = false;
	}, true);
	
	document.addEventListener('mousemove', function(e) {
		event.preventDefault();
		if (isDown) {
			divOverlay.style.left = (e.clientX + offset[0]) + 'px';
			divOverlay.style.top  = (e.clientY + offset[1]) + 'px';
		}
	}, true);
	
	
}

function reload() {
	location.reload();
}

// Start recording
function start() {
	active = true;

	//start the video
	document.getElementById("play-pause").click();

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
		if (element.className == "pulse-side-button") {
			if (element.style.backgroundColor == "red") {
				console.log("["+getTime()+"] End of event: "+element.title);
				element.setAttribute("style", "background-color: black");
			} else {
				console.log("["+getTime()+"] Start of event: "+element.title);
				element.setAttribute("style", "background-color: red");
			}
		} else if (element.nodeName == "INPUT") {
			console.log("["+getTime()+"] Comment: "+element.value);
			element.value = "";
		} else if (element.nodeName == "A") {
			console.log("["+getTime()+"] Activity: "+element.innerHTML);
		} else {
			console.log("["+getTime()+"] Event: "+element.title);
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
}

