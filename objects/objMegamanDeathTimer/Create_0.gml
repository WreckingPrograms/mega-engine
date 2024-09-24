// Because the Mega Man object is destoyed upon death, we need to make a different object execute the room restarting code
// This object restarts the room after some time

delay(210, function() {

	global._lives -= 1;
	global.lastRoom = room;

	var ID = instanceCreate(x, y, objFadeout);
	if global._lives >= 0
	{
	    ID.type = "restart";
	}
	else
	{
	    ID.type = "room";
	    ID.myRoom = rmPass;
	    global.passPlayVictory = false;
	    global.passContinueRoom = room;
	}
    
	instance_destroy();

});