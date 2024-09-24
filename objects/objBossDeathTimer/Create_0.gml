// Handles the boss's death
// Also transforms into the Mega Man that automatically moves to the center of the screen

delay(240, function() {

	// Lock movement and play victory jingle
	playerLockMovement();
	playMusicNoLoop(mscVictory);
	with objMegaman event_user(0); // Resets the colors, so charging the buster won't affect the colors

	delay(270, function() {
	
		// Start acting as Mega Man, and move to center
		x = objMegaman.x;
		y = objMegaman.y;
		sprite_index = sprMegamanWalk;
		imgSpd = 0.15;
		isMM = true;

		with objMegaman instance_destroy();	
	
	});

});

startFadeOut = function() {

	var ID = instanceCreate(x, y, objFadeout);
		ID.type = "room";
    
	if !global.weaponUnlocked[global.weaponID]
	{
		ID.myRoom = rmWeaponGet;
		global.passPlayVictory = false;
	}
	else
	{
		ID.myRoom = rmPass;
		global.passPlayVictory = true;
	}

	global.passContinueRoom = room;

};

xspeed = 0;
yspeed = 0;
isMM = false;
ground = true;
prevGround = ground;
canInitJump = true;
absorbing = false;
absorbAmount = 0;
startTeleportTimer = 0;
teleporting = false;
teleportTimer = 0;
teleportY = 0;
imgSpd = 0;

with objMegaman canPause = false;

