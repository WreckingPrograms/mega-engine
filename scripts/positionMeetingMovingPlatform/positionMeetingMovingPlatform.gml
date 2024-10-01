/// @description positionMeetingMovingPlatform(xx, yy, objects...)
/// @param xx
/// @param yy
/// @param objects...

// Checks for collision with moving platforms, respecting their "dead" parameter
// Optionally, you can supply multiple objects to this function as the trailing arguments
// This function specifically can also check collision for other objects with no "dead" parameter
// Each object argument can also be an array of objects, in which case every object in that array will be checked for

function positionMeetingMovingPlatform(xx, yy)
{
	var objects = [];
	for (var i = 2; i < argument_count; i++)
	{
		if is_array(argument[i])
			objects = array_concat(objects, argument[i]);
		else
			array_push(objects, argument[i]);
	}
	
	for (var i = 0, len = array_length(objects); i < len; i++)
	{
		var obj = objects[i];
		var inst = instance_position(xx, yy, obj);
		if isMovingPlatform(obj)
		{
			if inst >= 0 && !inst.dead
				return true;
		}
		else
		{
			if inst >= 0
				return true;
		}
	}
	
	return false;
}