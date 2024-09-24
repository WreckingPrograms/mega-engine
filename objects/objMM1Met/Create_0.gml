event_inherited();

image_xscale = -1;

respawn = true;

healthpointsStart = 1;
healthpoints = healthpointsStart;
contactDamage = 1;
reflectProjectiles = true;
reflectProjectilesRight = false; // Only reflect projectiles that come from the right
reflectProjectilesLeft = false; // Only reflect projectiles that come from the left


weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 2;

weaponDamage[Weapons.METAL_BLADE] = 2;

weaponDamage[Weapons.PHARAOH_SHOT] = 2;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 2;

weaponDamage[Weapons.STAR_CRASH] = 1;

weaponDamage[Weapons.SILVER_TOMAHAWK] = 2; // To make the tomahawk not destroy upon impact with the Met
weaponDamage[Weapons.WIND_STORM] = 2;


// Enemy specific code
radius = 4 * 16; // Four blocks; the radius that MM needs to enter to trigger the shooting of the Met
cooldownTimer = 0;
canShoot = true;
shootPhase = 0;
image_speed = 0;
image_index = 0;

