image_speed = 0;
canCoil = false;
teleporting = true;
teleportTimer = 0;
teleportY = 0;
teleportingUp = false;
sprite_index = sprRushTeleport;
yspeed = 0;
xspeed = 0;

shouldLand = true;

// Writing this as "function teleportAway()" makes the delay call below not work
// Maybe GML internally puts normal function definitions at the bottom of the event?
teleportAway = function() {

	teleportingUp = true;
	sprite_index = sprRushTeleport;
	playSFX(sfxTeleportOut);
	canCoil = false;
	
};
    
delay(4 * 60, teleportAway);

