dead = false;
canInitDeath = true;
beenOutsideView = false;
canHit = true;

xspeed = 0;
yspeed = 0;
ground = false;

respawn = true; // Should we respawn after leaving the screen and entering it again?

// Default damage values
weaponDamage = array_create(Weapons.COUNT, 0);
weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamage[Weapons.SILVER_TOMAHAWK] = 2;
weaponDamage[Weapons.WIND_STORM] = 2;
weaponDamage[Weapons.PHARAOH_SHOT] = 1;
weaponDamage[Weapons.METAL_BLADE] = 1;
weaponDamage[Weapons.STAR_CRASH] = 3;

weaponDamageSpecial = array_create(Weapons.COUNT, 0); // For charged variations of weapons, etc.
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 3;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 4;

// Function that's called when the enemy is hit by an attack
// Individual enemies can override this function to trigger their own on-hit events, if desired
// Returns whether or not the enemy was successfully damaged
function onHit(weapon, inst, specialDamage=false, pierceType=WeaponPierceTypes.NO_PIERCE)
{
	return onEnemyHit(weapon, inst, specialDamage, pierceType);
}

// Function that's called when the enemy is hit by an attack
// Individual enemies can override this function to trigger their own on-death events, if desired
function onDeath(weapon, inst)
{
	onEnemyDeath(weapon, inst);
}