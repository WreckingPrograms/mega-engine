//Creation code (all optional):

event_inherited();

image_xscale = -1;

respawn = true;

healthpointsStart = 10;
healthpoints = healthpointsStart;
contactDamage = 3;
reflectProjectiles = true;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left


damageBuster = 1;
damageBusterCharged = 3;

damageMetalBlade = 2;

damagePharaohShot = 1;
damagePharaohShotCharged = 4;

damageStarCrash = 4;

damageSilverTomahawk = 2;
damageWindStorm = 2;


//Enemy specific code
shootTimer = 0;
shooting = false;
shootAmount = 0;
randomize();
shootAmountMax = choose(5, 10);
xspeed = 0;
yspeed = 0;
image_speed = 0;
image_index = 0;

