/// @description placeMeetingMovingPlatform(xx, yy, objects...)
/// @param xx
/// @param yy
/// @param objects...

// Checks for collision with moving platforms, respecting their "dead" parameter
// Optionally, you can supply multiple objects to this function as the trailing arguments

function placeMeetingMovingPlatform(xx, yy)
{
	for (var i = 2; i < argument_count; i++)
	{
		var movingPlatform = instance_place(xx, yy, argument[i]);
		if movingPlatform >= 0 && !movingPlatform.dead
			return true;
	}
	
	return false;
}