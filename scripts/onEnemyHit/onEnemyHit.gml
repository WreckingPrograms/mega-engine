// Function that (by default) is run when an enemy is hit by a player attack
// Returns whether or not the enemy was successfully damaged
// "inst" refers to the attack object that hits the enemy
function onEnemyHit(weapon, inst, specialDamage, pierceType)
{
	if canEnemyBeHitByAttack(weapon, inst)
	{
		if canHit 
	    {
	        healthpoints -= specialDamage ? weaponDamageSpecial[weapon] : weaponDamage[weapon];
	        visible = false;
	    }
        
	    delay(2, function() {
		
			if !dead
				visible = true;
	
		});
        
		stopWeaponSound(inst.object_index);
	    playSFX(sfxEnemyHit);
        
	    if healthpoints <= 0
	    {
			onDeath(weapon, inst);
	    }
		
		switch pierceType
		{
			case WeaponPierceTypes.NO_PIERCE: instance_destroy(other); break;
			case WeaponPierceTypes.OVERKILL_PIERCE: if healthpoints >= 0 { instance_destroy(other); } break;
			case WeaponPierceTypes.SOFT_PIERCE: if healthpoints > 0 { instance_destroy(other); } break;
		}
		
		return true;
	}
	else
	{
	    event_user(0); // Reflect the projectile
		return false;
	}
}