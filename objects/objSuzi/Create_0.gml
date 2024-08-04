// Variable definitions:
// col = <number> (0 = red (default); 1 = orange; 2 = blue)
// dir = "hor"/"ver" ("hor" = horizontal (default); "ver" = vertical)
// startDir = -1/1 (1 makes the suzi move right/down first (default); -1 makes the suzi move left/up first)

event_inherited();

respawn = true;

healthpointsStart = 5;
healthpoints = healthpointsStart;
contactDamage = 4;
reflectProjectiles = false;
reflectProjectilesRight = false; // Only reflect projectiles that come from the right
reflectProjectilesLeft = false; // Only reflect projectiles that come from the left


weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 3;

weaponDamage[Weapons.METAL_BLADE] = 1;

weaponDamage[Weapons.PHARAOH_SHOT] = 2;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 4;

weaponDamage[Weapons.STAR_CRASH] = 5;

weaponDamage[Weapons.SILVER_TOMAHAWK] = 2;
weaponDamage[Weapons.WIND_STORM] = 3;

beginStartDir = startDir;
moveTimer = 0;
moving = false;
xspeed = 0;
yspeed = 0;
image_speed = 0;
image_index = 0;

// Set the correct color
switch col
{
    case 0: sprite_index = sprSuziRed; break;
    case 1: sprite_index = sprSuziOrange; break;
    case 2: sprite_index = sprSuziBlue; break;
    default: sprite_index = sprSuziRed; break;
}

beginStartDir = startDir;