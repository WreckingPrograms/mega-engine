event_inherited();

image_xscale = -1;

respawn = true;

healthpointsStart = 6;
healthpoints = healthpointsStart;
contactDamage = 4;
reflectProjectiles = false;
reflectProjectilesRight = false; //Only reflect projectiles that come from the right
reflectProjectilesLeft = false; //Only reflect projectiles that come from the left


damageBuster = 1;
damageBusterCharged = 3;

damageMetalBlade = 1;

damagePharaohShot = 2;
damagePharaohShotCharged = 6;

damageStarCrash = 6;

damageSilverTomahawk = 2;
damageWindStorm = 2;


//Enemy specific code
shooting = false;
animTimer = 0;
bulletID = -10;
image_speed = 0;
image_index = 0;

if instance_exists(objMegaman)
{
    if x >= objMegaman.x
        image_xscale = -1;
    else
        image_xscale = 1;
}

