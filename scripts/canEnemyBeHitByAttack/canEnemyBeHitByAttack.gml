// Returns whether or not an enemy can be hit by a player attack (usually a projectile)
// Protective properties of the enemy are taken into account
// "inst" refers to the attack object that hits the enemy (optional)
function canEnemyBeHitByAttack(weapon, inst=noone)
{
	return (!reflectProjectiles && weaponDamage[weapon] != 0
		&& !(inst != noone && reflectProjectilesLeft && spriteGetXCenterObject(inst) < spriteGetXCenter())
		&& !(inst != noone && reflectProjectilesRight && spriteGetXCenterObject(inst) > spriteGetXCenter()));
}