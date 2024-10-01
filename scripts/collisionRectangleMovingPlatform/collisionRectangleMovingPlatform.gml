/// @description collisionRectangleMovingPlatform(x1, y1, x2, y2, objects...)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param objects...

// Checks for collision with moving platforms, respecting their "dead" parameter
// Optionally, you can supply multiple objects to this function as the trailing arguments
// This function specifically can also check collision for other objects with no "dead" parameter
// Each object argument can also be an array of objects, in which case every object in that array will be checked for

function collisionRectangleMovingPlatform(x1, y1, x2, y2)
{
	var objects = [];
	for (var i = 4; i < argument_count; i++)
	{
		if is_array(argument[i])
			objects = array_concat(objects, argument[i]);
		else
			array_push(objects, argument[i]);
	}
	
	for (var i = 0, len = array_length(objects); i < len; i++)
	{
		var obj = objects[i];
		var inst = collision_rectangle(x1, y1, x2, y2, obj, false, false);
		if isMovingPlatform(obj)
		{
			if inst >= 0 && !inst.dead
				return inst;
		}
		else
		{
			if inst >= 0
				return inst;
		}
	}
	
	return noone;
}