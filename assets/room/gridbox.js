/**
 * 
 */
const NUM_ROWS = 10;
const NUM_COLUMNS = 30;

function createBoxes(){
	var frame = document.getElementById('grid_div')
	for(var i = 0; i < NUM_ROWS; i++){
		for(j = 0; j < NUM_COLUMNS; j++){
			var box = document.createElement('div');
			var ID = "box_" + i + "_" + j;
			box.className = 'grid_boxes';
			box.id = ID;
			box.style.zIndex = 0;
			box.style.gridRowStart = i+1;
			box.style.gridColumnStart = j+1;

			//box.style.padding = "2%";
			
			if(j == 0)
				box.textContent = 10 - i - 1;
			else if(i == 9)
				box.textContent = j;
			
			frame.appendChild(box);
		}
	}
	//alert('hello');
}

function shadeGrid(x1, y1, x2, y2, bid){
	
	var frame = document.getElementById('grid_div');
	
	var height = y2 - y1;
	var width = x2 - x1;
	var x = x1+2;
	var y = NUM_ROWS - (height + y1);
	
	if(document.getElementById(bid) == null){
		var box = document.createElement('div');
		box.id = bid;
		box.className = "classroom_section"
		box.style.backgroundColor = "rgba(98,86, 80, 0.8)";
	}
	else
		var box = document.getElementById(bid);
	
	//box.style.gridRow= y + " / span " + height;
	//box.style.gridColumn = x + " / span " + width;
	box.style.gridRowStart = y;
	box.style.gridRowEnd = "span " + height;
	box.style.gridColumnStart = x;
	box.style.gridColumnEnd = "span " + width;
	box.style.border = "solid";
	box.style.zIndex = "3";
	box.style.color = "white";
	
	frame.appendChild(box);
	
	console.log("(" + x + "," + y+"); height: " + height + "; width: " + width);
	
	
	
}

function prepareCoords(num_ID){
	var BL = document.getElementById(num_ID+"B");
	var TR = document.getElementById(num_ID+"T");
	
	var bCoord = BL.value.replace(/\s+/g, '');
	var tCoord = TR.value.replace(/\s+/g, '');
	
	bArray = bCoord.substring(1, bCoord.length-1).split(',');
	tArray = tCoord.substring(1, tCoord.length-1).split(',');
	
	var x1, x2, y1, y2;
	
	x1 = parseInt(bArray[0], 10);
	y1 = parseInt(bArray[1], 10);
	x2 = parseInt(tArray[0], 10);
	y2 = parseInt(tArray[1], 10);
	
	//alert("(" + x1 + "," + y1 + ")" + "(" + x2 + "," + y2 + ")");
	//alert(typeof x1);
	//alert(x1);
	if(isNaN(x1) || isNaN(x2) || isNaN(y1) || isNaN(y2))
		alert("Error in box" + num_ID + "!");
	else if(x1 == 0 && x2 == 0 && y1 == 0 && y2 == 0 && document.getElementById(num_ID) != null)
		document.getElementById(num_ID).remove();
	else
		shadeGrid(x1,y1,x2,y2, num_ID);
	
}

function endBox() {
	
}

