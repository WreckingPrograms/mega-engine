// Variable definitions:
// col = <number> (0 = red (default); 1 = orange; 2 = blue)

event_inherited();

respawn = true;

healthpointsStart = 3;
healthpoints = healthpointsStart;
contactDamage = 1;
reflectProjectiles = false;
reflectProjectilesRight = false; // Only reflect projectiles that come from the right
reflectProjectilesLeft = false; // Only reflect projectiles that come from the left


weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 3;

weaponDamage[Weapons.METAL_BLADE] = 1;

weaponDamage[Weapons.PHARAOH_SHOT] = 2;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 4;

weaponDamage[Weapons.STAR_CRASH] = 2;

weaponDamage[Weapons.SILVER_TOMAHAWK] = 3;
weaponDamage[Weapons.WIND_STORM] = 3;


// Enemy specific code
shootTimer = 0;
shooting = false;
shootAmount = 0;
animate = false;
animateTimer = 0;
image_xscale = 1;
image_speed = 0;
image_index = 0;

radius = 100;

// Set the correct color
switch col
{
    case 0: sprite_index = sprScrewBomberRed; break;
    case 1: sprite_index = sprScrewBomberOrange; break;
    case 2: sprite_index = sprScrewBomberBlue; break;
    default: sprite_index = sprScrewBomberRed; break;
}