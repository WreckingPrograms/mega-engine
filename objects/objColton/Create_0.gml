event_inherited();

image_xscale = -1;

respawn = true;

healthpointsStart = 6;
healthpoints = healthpointsStart;
contactDamage = 4;
reflectProjectiles = false;
reflectProjectilesRight = false; // Only reflect projectiles that come from the right
reflectProjectilesLeft = false; // Only reflect projectiles that come from the left


weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 3;

weaponDamage[Weapons.METAL_BLADE] = 1;

weaponDamage[Weapons.PHARAOH_SHOT] = 2;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 6;

weaponDamage[Weapons.STAR_CRASH] = 6;

weaponDamage[Weapons.SILVER_TOMAHAWK] = 2;
weaponDamage[Weapons.WIND_STORM] = 2;


// Enemy specific code
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

