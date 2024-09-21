/// @description collisionRectangleMulti(x1, y1, x2, y2, precise, notme, objects...)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param objects...

// Perform collision_rectangle for multiple objects at once. Returns the ID of the first object it finds, or noone if none are found.
// Optionally, you can supply multiple objects to this function as the trailing arguments

function collisionRectangleMulti(x1, y1, x2, y2)
{ 
	for (var i = 4; i < argument_count; i++)
	{
		if argument[i] == prtMovingPlatformSolid || argument[i] == prtMovingPlatformJumpthrough
		{
			var inst = collisionRectangleMovingPlatform(x1, y1, x2, y2, argument[i]);
			if inst >= 0
				return inst;
		}
		else
		{
			var inst = collision_rectangle(x1, y1, x2, y2, argument[i], false, false);
			if inst >= 0
				return inst;
		}
	}

	return noone;
}
