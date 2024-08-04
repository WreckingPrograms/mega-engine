// / @function playerCamera
// / @description Handles the camera. Call it in objMegaman
function playerCamera() {



	// Follow the player
	global.viewX = x - (global.viewWidth / 2);
	global.viewY = y - (global.viewHeight / 2);


	// Stop at section borders
	if global.viewX > sectionRight - global.viewWidth
	    global.viewX = sectionRight - global.viewWidth;
	else if global.viewX < sectionLeft
	    global.viewX = sectionLeft;
    
	if global.viewY > sectionBottom - global.viewHeight
	    global.viewY = sectionBottom - global.viewHeight
	else if global.viewY < sectionTop
	    global.viewY = sectionTop;
    
    
	// Stop at room borders
	if global.viewX > room_width - global.viewWidth
	    global.viewX = room_width - global.viewWidth;
	else if global.viewX < 0
	    global.viewX = 0;
    
	if global.viewY > room_height - global.viewHeight
	    global.viewY = room_height - global.viewHeight;
	else if global.viewY < 0
	    global.viewY = 0;


}
