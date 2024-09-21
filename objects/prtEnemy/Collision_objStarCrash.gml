if !dead
{
	if onHit(Weapons.STAR_CRASH, other.id)
	{
		if other.xspeed == 0 // When it is not yet fired
	        playerConsumeAmmo(global.currentWeapon, global.weaponAmmoContact[global.weaponSlot[global.currentWeapon]]);
	}
}