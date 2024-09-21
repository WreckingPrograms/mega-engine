/// @description collisionRectangleMovingPlatform(x1, y1, x2, y2, objects...)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param objects...

// Checks for collision with moving platforms, respecting their "dead" parameter
// Optionally, you can supply multiple objects to this function as the trailing arguments

function collisionRectangleMovingPlatform(x1, y1, x2, y2)
{
	for (var i = 4; i < argument_count; i++)
	{
		var movingPlatform = collision_rectangle(x1, y1, x2, y2, argument[i], false, false);
		if movingPlatform >= 0 && !movingPlatform.dead
			return movingPlatform;
	}
	
	return noone;
}