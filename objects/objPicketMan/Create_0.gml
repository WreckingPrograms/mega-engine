event_inherited();

image_xscale = -1;

respawn = true;

healthpointsStart = 10;
healthpoints = healthpointsStart;
contactDamage = 3;
reflectProjectiles = true;
reflectProjectilesRight = false; // Only reflect projectiles that come from the right
reflectProjectilesLeft = false; // Only reflect projectiles that come from the left


weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 3;

weaponDamage[Weapons.METAL_BLADE] = 2;

weaponDamage[Weapons.PHARAOH_SHOT] = 1;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 4;

weaponDamage[Weapons.STAR_CRASH] = 4;

weaponDamage[Weapons.SILVER_TOMAHAWK] = 2;
weaponDamage[Weapons.WIND_STORM] = 2;


// Enemy specific code
shootTimer = 0;
shooting = false;
shootAmount = 0;
shootAmountMax = choose(5, 10);
canShootPicket = true;
xspeed = 0;
yspeed = 0;
image_speed = 0;
image_index = 0;

