 // Crush something if a moving platform moves it into a solid object
 // Call this on the instance that might be crushed
 function crushInstanceIfNeeded(moveX, moveY, movedBy)
 {
	var yOffset = (object_index == objMegaman) ? (isSlide ? 2 : 0) : 0;
	var solids = [];
	instancePlaceArrayMovingPlatform(x + moveX, y + moveY + yOffset, solids, objSolid, prtMovingPlatformSolid);
						
	for (var i = 0, len = array_length(solids); i < len; i++)
	{
		var _solid = solids[i];
		if _solid.id != movedBy
		{
			if object_index == objMegaman
			{
				global._health = 0;
			}
			else if object_is_ancestor(object_index, prtEnemy)
			{
				if !dead
				{
					healthpoints = 0;
					onDeath(Weapons.COUNT, movedBy);
				}
			}
			else if !isMovingPlatform()
			{
				if variable_instance_exists(id, "healthpoints")
					healthpoints = 0;
				else
					instance_destroy();
			}
								
			break;
		}
	}
}