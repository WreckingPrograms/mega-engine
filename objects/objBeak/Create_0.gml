// Variable definitions:
// col = <number> (0 = red (default); 1 = orange; 2 = blue)
// dir = -1/1 (1 = faces right (default); -1 = faces left)

event_inherited();

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

weaponDamage[Weapons.SILVER_TOMAHAWK] = 2;
weaponDamage[Weapons.WIND_STORM] = 2;


// Enemy specific code
shootTimer = 0;
shootPhase = 0;
shooting = false;
image_speed = 0;
image_index = 0;

// Set the correct color
switch col
{
    case 0: sprite_index = sprBeakRed; break;
    case 1: sprite_index = sprBeakOrange; break;
    case 2: sprite_index = sprBeakBlue; break;
    default: sprite_index = sprBeakRed; break;
}

image_xscale = dir;