//Creation code (all optional):
//col = <number> (0 = red (default); 1 = blue; 2 = red with orange eyes)

//NOTE: Big Eye actually telegraphs if he's going to do a low or high jump in this game
//If he's going to do a high jump, his eye will close
//If he's going to do a low jump, his eye will stay open

event_inherited();

image_xscale = -1;
respawn = true;

healthpointsStart = 20;
healthpoints = healthpointsStart;
contactDamage = 10;
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left


damageBuster = 1;
damageBusterCharged = 3;

damageMetalBlade = 2;

damagePharaohShot = 4;
damagePharaohShotCharged = 10;

damageStarCrash = 7;

damageSilverTomahawk = 4;
damageWindStorm = 4;


//Enemy specific code
col = 0; //0 = red; 1 = blue; 2 = red with orange eyes

moveTimer = 0;
xspeed = 0;
yspeed = 0;
repeatAmount = 0;
repeatIsHigh = true;
ground = true;
image_speed = 0;
image_index = 0;
prevGround = true;


alarm[0] = 1;

