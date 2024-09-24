event_inherited();

image_speed = 0;
canJet = true;
teleporting = true;
teleportTimer = 0;
teleportY = 0;
teleportingUp = false;
sprite_index = sprRushTeleport;
yspeed = 0;
xspeed = 0;
decreaseAmmoTimer = 0;
decreaseAmmoTimerMax = 60;
shouldLand = true;
mask_index = sprNothing;

spd = 1;
ySpd = 1;

teleportAwayForce = function() {

	teleportingUp = true;
	sprite_index = sprRushTeleport;
	playSFX(sfxTeleportOut);
	dead = true;
	xspeed = 0;
	yspeed = 0;
	mask_index = sprNothing;

	with objMegaman
	{
	    if onRushJet 
	    {
	        onRushJet = false;
	        canMove = true;
	    }
	}
	
};

teleportAway = function() {

	if !canJet
		return;
		
	teleportAwayForce();
	
};
    
delay(4 * 60, teleportAway);

// Moving platform code
dead = true;
respawn = false;
neverDespawn = true;

