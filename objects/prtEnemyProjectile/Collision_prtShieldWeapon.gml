instance_destroy(other);
instance_destroy();

if other.xspeed == 0 // When it is not yet fired
{
	playerConsumeAmmo(global.currentWeapon, global.weaponAmmoContact[global.weaponSlot[global.currentWeapon]]);
}