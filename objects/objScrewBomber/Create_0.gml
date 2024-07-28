//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)

event_inherited();

respawn = true;

healthpointsStart = 3;
healthpoints = healthpointsStart;
contactDamage = 1;
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left


damageBuster = 1;
damageBusterCharged = 3;

damageMetalBlade = 1;

damagePharaohShot = 2;
damagePharaohShotCharged = 4;

damageStarCrash = 2;

damageSilverTomahawk = 3;
damageWindStorm = 3;


//Enemy specific code
col = 0; //0 = red; 1 = orange; 2 = blue

shootTimer = 0;
shooting = false;
shootAmount = 0;
animate = false;
animateTimer = 0;
image_xscale = 1;
image_speed = 0;
image_index = 0;

radius = 100;


alarm[0] = 1;

