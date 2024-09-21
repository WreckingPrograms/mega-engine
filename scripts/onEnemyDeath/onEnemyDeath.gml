// Function that (by default) is run when an enemy is destroyed
// "inst" refers to the attack object that hits the enemy
function onEnemyDeath(weapon, inst)
{
	if object_get_parent(object_index) != prtBoss
	{		
		switch weapon
		{
			case Weapons.WIND_STORM:
	            var windID = instanceCreate(spriteGetXCenter(), spriteGetYCenter(), objEnemyWindStorm);
	                windID.enemySpr = sprite_index;
	                windID.enemyImg = image_index;
	                windID.enemyXScale = image_xscale;
	                windID.enemyYScale = image_yscale;
	                windID.enemyAngle = image_angle;
	                windID.image_index = other.image_index;
	                windID.image_speed = other.image_speed;
	                windID.image_xscale = other.image_xscale;
                
	            dead = false;
			break;
			
			default:
				instanceCreate(spriteGetXCenter(), spriteGetYCenter(), objItemExplosion);
			break;
		}
	}
}