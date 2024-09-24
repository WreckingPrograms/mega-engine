event_inherited();

startIntro = false;
isIntro = false;
startFight = false;
isFight = false;

xspeed = 0;
yspeed = 0;
image_xscale = -1;
image_speed = 0;
image_index = 0;

healthpoints = 28;
prevHealthPoints = healthpoints;
canHit = true;
drawHitSpark = false;
drawBoss = true; // Should we be visible? (Can't use the 'visible' variable as this prevents the Draw event from executing)

alarm[8] = 1;

toggleHitspark = function() {

	if canHit
		return;
		
	drawHitSpark = !drawHitSpark;
	drawBoss = !drawBoss;

	delay(2, toggleHitspark);
	
};

endInvincibility = function() {

	canHit = true;
	drawBoss = true;
	drawHitSpark = false;

};


// Variables to make it work with prtEnemy
reflectProjectiles = false;
reflectProjectilesLeft = false;
reflectProjectilesRight = false;
dead = false;

