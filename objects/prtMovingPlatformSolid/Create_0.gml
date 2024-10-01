event_inherited();

xspeed = 0;
yspeed = 0;

movedByPlatformsThisFrame = [];

// Move, and push/move any objects if needed
// chain: list of objects, in order, that were moved together (e.g. a stack of moving platforms)
// movedObjects: entities that were already moved and should not be moved again
function move(moveX, moveY, chain=undefined, movedObjects=undefined, canMoveBack=true)
{
	if is_undefined(chain) chain = [];
	if is_undefined(movedObjects) movedObjects = [];
	
	// Copy chain array so it's not modified in place
	var tempChain = array_create(array_length(chain));
	array_copy(tempChain, 0, chain, 0, array_length(chain));
	chain = tempChain;
	array_push(chain, id);
	
	// Check for collisions. If we can't move all the way, move other objects
	// the same distance it took to be pushed out. This only applies for moving platforms that
	// themselves can be moved
	if isMovableObject()
	{
		var collisions = [];
		var objectsToCheck = (moveY > 0)
			? [objSolid, prtMovingPlatformSolid, objTopSolid, prtMovingPlatformJumpthrough]
			: [objSolid, prtMovingPlatformSolid];
		instancePlaceArrayMovingPlatform(x + moveX, y + moveY, collisions, objectsToCheck);
		collisions = array_filter(collisions, method({ movedObjects: movedObjects, _id: id }, function(inst, index) {
	
			if array_contains(movedObjects, inst.id) || inst.id == _id || isMovableObject(inst.object_index)
				return false;
			
			if (inst.object_index == objTopSolid || inst.object_index == prtMovingPlatformJumpthrough)
				&& _id.bbox_bottom > inst.bbox_top
			{
				return false;
			}
		
			return true;
	
		}));
	
		var collisionCount = array_length(collisions);
		if collisionCount > 0
		{
			x += moveX;
			y += moveY;
	
			var moveBackX = 0, moveBackY = 0;
			for (var i = 0; i < collisionCount; i++)
			{
				var inst = collisions[i];
				var topOnly = (inst.object_index == objTopSolid || inst.object_index == prtMovingPlatformJumpthrough);
			
				if !topOnly
				{
					if moveX < 0
						moveBackX = max(moveBackX, inst.bbox_right - bbox_left);
					if moveX > 0
						moveBackX = min(moveBackX, inst.bbox_left - bbox_right);
					if moveY < 0
						moveBackY = max(moveBackY, inst.bbox_bottom - bbox_top);
				}
			
				if moveY > 0
					moveBackY = min(moveBackY, inst.bbox_top - bbox_bottom);
			}
		
			if moveBackX != 0
			{
				for (var i = 0, len = array_length(chain); i < len; i++)
				{
					with chain[i]
					{
						xspeed = 0;
					}
				}
			}
		
			if moveBackY != 0
			{
				for (var i = 0, len = array_length(chain); i < len; i++)
				{
					with chain[i]
					{
						yspeed = 0;
					}
				}
			}
		
			// Push other objects back out, even if they've moved us before
			if moveBackX != 0 || moveBackY != 0
			{
				if canMoveBack
				{
					move(moveBackX, moveBackY, [id], undefined, false);
				}
				else
				{
					// We're trying to move back from a move-back... that indicates that the stack of
					// moving platforms cannot fit in this space (the moving platform is "crushed").
					// Not much we can do besides destroying the platform
					healthpoints = 0;
				}
			}
		
			x -= moveX;
			y -= moveY;
		}
	}

	// Move
    x += moveX;
    y += moveY;
    
    // Push objects in the direction the platform moving
	// Only left, right and downward movement handled here; upward "carrying" is handled further below
	collisions = [];
	instancePlaceArrayMovingPlatform(x, y, collisions, global.movableObjects);
	
	for (var i = 0, len = array_length(collisions); i < len; i++)
	{
		var inst = collisions[i];
		if array_contains(movedObjects, inst.id) || inst.id == id
			continue;
			
	    if canBeMovedByPlatform(inst)
	    {
	        var leftDist = (moveX < 0) ? inst.bbox_right - bbox_left : 9999; // 9999 means the object can't be pushed in that direction
	        var rightDist = (moveX > 0) ? bbox_right - inst.bbox_left : 9999;
	        var upDist = (moveY < 0) ? inst.bbox_bottom - bbox_top : 9999;
	        var downDist = (moveY > 0) ? bbox_bottom - inst.bbox_top : 9999;
                
	        var minDist = min(leftDist, rightDist, upDist, downDist);
			var minDistIsHorizontal = (minDist == leftDist || minDist == rightDist)
			if minDist != 9999 && minDist <= max(minDistIsHorizontal ? moveX * 2 : moveY * 2, 2)
			{
				var pushX = 0, pushY = 0;
		        if minDist != upDist // Upward carrying is handled separately below
				{
		            if minDist == leftDist
			            pushX = -leftDist;
			        else if minDist == rightDist
			            pushX = rightDist;
			        else if minDist == downDist
			            pushY = downDist;
				}
					
				if pushX != 0 || pushY != 0
				{
					if isMovingPlatform(inst.object_index)
					{
						with inst
						{
							array_push(movedByPlatformsThisFrame, other.id);
							move(pushX, pushY, chain, array_concat(movedObjects, [other.id]), canMoveBack);
						}
					}
					else
					{
						with inst
						{
							crushInstanceIfNeeded(pushX, pushY, other.id);
							x += pushX;
							y += pushY;
						}
					}
				}
			}
	    }
	}
    
	// Move objects standing on top of the platform
	var checkMoveY = (moveY > 0) ? moveY : 0;        
	collisions = [];
	instancePlaceArrayMovingPlatform(x, y - checkMoveY - 1, collisions, global.movableObjects);
	for (var i = 0, len = array_length(collisions); i < len; i++)
	{
		var inst = collisions[i];
		if array_contains(movedObjects, inst.id) || inst.id == id
			continue;
	
		var checkYOffset = isMovingPlatform(inst.object_index)
			? 0
			: ((inst.yspeed > 0) ? inst.yspeed * global.dt : 0);
		
	    if inst.bbox_bottom <= bbox_top - moveY + checkYOffset + 1 && canBeMovedByPlatform(inst)
	    {
	        with inst
	        {
				var isMovingPlat = isMovingPlatform();
	            var proceed = true;
                
				if !isMovingPlat
				{
					// Don't push entities into walls (that aren't the platform they're moved by)
					var solids = [];
					instancePlaceArrayMovingPlatform(x + moveX, y, solids, objSolid, prtMovingPlatformSolid);
					for (var n = 0, len2 = array_length(solids); n < len2; n++)
					{
						if solids[n].id != other.id
						{
							proceed = false;
							break;
						}
					}
				}
                
	            if proceed 
	            {
					if isMovingPlat
					{
						array_push(movedByPlatformsThisFrame, other.id);
						move(moveX, moveY, chain, array_concat(movedObjects, [other.id]), canMoveBack);
					}
					else
					{
						crushInstanceIfNeeded(moveX, moveY, other.id);
		                x += moveX;
		                y += moveY;
					}
					
					if variable_instance_exists(id, "ground")
						ground = true;
	            }
	        }
	    }
	}
}

// For objects that can't be moved by moving platforms under certain circumstances,
// write the conditions here
function canBeMovedByPlatform(inst)
{
	switch inst.object_index
	{
		case objMegaman: return (!inst.teleporting && !inst.showReady);
	}
	
	return true;
}