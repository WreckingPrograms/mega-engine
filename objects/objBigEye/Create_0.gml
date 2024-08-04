// Variable definitions:
// col = <number> (0 = red (default); 1 = blue; 2 = red with orange eyes)

// NOTE: Big Eye actually telegraphs if he's going to do a low or high jump in this game
// If he's going to do a high jump, his eye will close
// If he's going to do a low jump, his eye will stay open

event_inherited();

image_xscale = -1;
respawn = true;

healthpointsStart = 20;
healthpoints = healthpointsStart;
contactDamage = 10;
reflectProjectiles = false;
reflectProjectilesRight = false; // Only reflect projectiles that come from the right
reflectProjectilesLeft = false; // Only reflect projectiles that come from the left


weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 3;

weaponDamage[Weapons.METAL_BLADE] = 2;

weaponDamage[Weapons.PHARAOH_SHOT] = 4;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 10;

weaponDamage[Weapons.STAR_CRASH] = 7;

weaponDamage[Weapons.SILVER_TOMAHAWK] = 4;
weaponDamage[Weapons.WIND_STORM] = 4;


// Enemy specific code
moveTimer = 0;
xspeed = 0;
yspeed = 0;
repeatAmount = 0;
repeatIsHigh = true;
ground = true;
image_speed = 0;
image_index = 0;
prevGround = true;

// Set the correct color
switch col
{
    case 0: sprite_index = sprBigEyeRed; break;
    case 1: sprite_index = sprBigEyeBlue; break;
    case 2: sprite_index = sprBigEyeOrange; break;
    default: sprite_index = sprBigEyeRed; break;
}