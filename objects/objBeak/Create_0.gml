//Creation code (all optional):
//col = <number> (0 = red (default); 1 = orange; 2 = blue)
//dir = -1/1 (1 = faces right (default); -1 = faces left)

event_inherited();

respawn = true;

healthpointsStart = 1;
healthpoints = healthpointsStart;
contactDamage = 1;
reflectProjectiles = true;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left


damageBuster = 1;
damageBusterCharged = 2;

damageMetalBlade = 2;

damagePharaohShot = 2;
damagePharaohShotCharged = 2;

damageStarCrash = 1;

damageSilverTomahawk = 2;
damageWindStorm = 2;


//Enemy specific code
col = 0; //0 = red; 1 = orange; 2 = blue
    
dir = 1;

shootTimer = 0;
shooting = false;
image_speed = 0;
image_index = 0;


alarm[0] = 1;

