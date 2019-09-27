<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="ISO-8859-1">
	<title>ROCA Observation Tool</title>
	<link rel="stylesheet" type='text/css' href="assets/stylesheet.css">
	<link rel="stylesheet" type='text/css' href="assets/themify-icons.css">
	<link rel="stylesheet" type='text/css' href="assets/fonts/stylesheet.css">
	<link rel="stylesheet" type='text/css' href="assets/popupCSS.css">
    <style>
	#classroom_mapping {
		background-image: url("/assets/room/images/THN-E316.jpg");
	}
	</style>
	<script>
		function createBoxes() {
			shadeGrid(1,1,8,6, 1);
			shadeGrid(8,0,13,5, 2);
			shadeGrid(8,5,13,7, 3);
			shadeGrid(13,0,19,5, 4);
			shadeGrid(13,5,19,7, 5);
			shadeGrid(19,1,26,6, 6);
		}
    </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="text/javascript" src="/Users/helenlin/Downloads/roca%202/obs.js"></script>
</head>
<?php include 'db.php'; ?>
<body onload="setAllDefaultValues()">
	<!-- Data from forms set to invisible iframe: WILL NEED TO CHANGE THIS LATER -->
	<iframe name="dump_data_frame" id="dump_data_frame"></iframe>
	
	<div class="body_content">
		<!-- BEGIN: left_side div -->
		<!-- Contains classroom pic and majority of inputs -->
		<div id="left_side">
			<!-- BEGIN: top_left div -->
			<!-- Contains back button and room name -->
			<form autocomplete="off" id="student_events_form" target="dump_data_frame"></form>
			<div id="top_left">
				<div><a onclick="location.href='index.php'" style="vertical-align: middle"><span id="back_arrow" class="ti-arrow-left" ></span></a>&nbsp;&nbsp;&nbsp;Thornton Hall E-Wing 316</div>
				
				<!-- NEEDS: Pull From Database -->
				
				
				
    				<div class="class_section_input" id="s1"><?php getfromcodebank(4, 1) ?></div>
    				<div class="class_section_input" id="s2"><?php getfromcodebank(4, 2) ?></div>
    				<div class="class_section_input" id="s3"><?php getfromcodebank(4, 3) ?></div>
    				<div class="class_section_input" id="s4"><?php getfromcodebank(4, 4) ?></div>
    				<div class="class_section_input" id="s5"><?php getfromcodebank(4, 5) ?></div>
    				<div class="class_section_input" id="s6"><?php getfromcodebank(4, 6) ?></div>
    				
				
			</div>
			<!-- BEGIN: classroom mapping -->
			<div id="classroom_mapping">
				
			</div>
			
			<div id="bottom_left">
				<div class="dropdown">
					<button class="button">student activities</button>
					<div class="dropdown-content">
						<?php getfromcodebank(2, null) ?>
					</div>
				</div>

				<div class="dropdown">
					<button class="button">instructor activities</button>
					<div class="dropdown-content">
							<!-- <a onclick="dataToFeed(event, this)">Lecturing</a>
							<a onclick="dataToFeed(event, this)">Lecturing while writing</a>
							<a onclick="dataToFeed(event, this)">Lecturing from pre-made visuals</a>
							<a onclick="dataToFeed(event, this)">Lecturing with demonstration of phenomena</a>
							<a onclick="dataToFeed(event, this)">Interactive lecture</a>
							<a onclick="dataToFeed(event, this)">Multimedia</a>
							<a onclick="dataToFeed(event, this)">Clicker question</a>
	
	
	
							<div class="dropdownInsideDropdown">
								<a onclick="showSubmenu()">Administrative Task</a>
								<div class="dropdown2-content">
									<a onclick="dataToFeed(event, this);hideSubmenu();">1</a>
									<a onclick="dataToFeed(event, this);hideSubmenu();">2</a>
									<a onclick="dataToFeed(event, this);hideSubmenu();">3</a>
									<a onclick="dataToFeed(event, this);hideSubmenu();">4</a>
								</div>
							</div>
	
	
	
	
	
							<a onclick="dataToFeed(event, this)">Idle</a> -->
							<?php getfromcodebank(1, null) ?>
					</div>
				</div>

				<div class="dropdown">
					<button class="button">instructor events</button>
					<div class="dropdown-content">
							<?php getfromcodebank(3, null) ?>
					</div>
				</div>
				
				
			
		
		
				
				<button class="pulse-button" title="Start" type="button" onclick="start_or_stop()" id="start_button"><span class="ti-control-play" style="vertical-align: -2px"></span></button>
				<button class="circularButton" title="Feed" type="button" id="feed_button" onclick="openFeed(event)"><span class="ti-comment-alt" style="vertical-align: -2px"></span></button>
				
			
				
				
				<div class="pen-wrapper" style="width:200px; display: inline-block">

    <div class="buton-cover button-slide-out">
    <span class="button-slide-out__above" style="text-align: center">are you sure?</span>

    <div class="button-slide-out__middle">
      <button class="btn" id="initiallyReset" onclick="resetButtonMixup()"><span class="ti-reload" style="vertical-align: -2px"></span></button>
    </div>

    <div class="button-slide-out__below">
      <button class="btn" id="initiallyCancel" onclick="reload()">cancel</button>
		</div>
		
		</div>

		
		
			
		

		</div><br /><br />
		<div style="text-align:center;">
		<div id="persistingFeed" style="display: inline-block;"></div><br /><br/>
				<div class="fadingFeed" style="display: inline-block;"></div>
		</div>

		
		



		
				

				<div id="feed" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
					  <div class="modal-header">
						<span class="close"></span>
						Feedback
					  </div>
						  
					  <div class="modal-body"></div>  
					  
					</div>
			    </div>



			</div>


		</div>
		<!-- END: left_side div -->
		
		<!-- BEGIN: right_side div -->
		<!-- Contains interval reading form -->
		<div id="right_side">
			<form id="interval_readings_form" target="dump_data_frame">
				<!-- Interval form category 1: Pedagogical Strategies -->
				<div id="Pedagogical_Strategies">

					<div id="timer" style="text-align: center">Timer</div><br /><br />
					
					<div class="subheader">What is the instructor doing?</div>
						<div class="checkbox-grid">
						  	<?php getfromcodebank(5) ?> 	 		
						</div>
				</div>
				<!-- Interval form category 2: Instructional Technologies -->
				<div id="Instructional Technologies">
					<div class="subheader">What technology is being used?</div>
					<div class="checkbox-grid">
						<?php getfromcodebank(7) ?>
					</div>
				</div>
				<!-- Interval form category 3: Student Engagement -->
				<div id="Student Engagement">
					<div class="subheader">What are the students doing?</div>
					<div class="checkbox-grid">
						<?php getfromcodebank(6) ?>
					</div>
				</div>
			</form>
		</div>
		<!-- END: right_side div -->
	</div>
	<form id="finalSubmit" action="obs.php">
  		<input type="hidden" id="fullData" name="fullData">
	</form>

</body>

<script>
        ; (function ($) {

            function clickHandler() {
                $(this).parents('.buton-cover').toggleClass('is_active');
            }

            $('.btn').on('click', clickHandler);

				}(jQuery));</script>
				
</html>