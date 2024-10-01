/// @description collisionRectangleMulti(x1, y1, x2, y2, precise, notme, objects...)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param objects...

// Perform collision_rectangle for multiple objects at once. Returns the ID of the first object it finds, or noone if none are found.
// Optionally, you can supply multiple objects to this function as the trailing arguments
// Each object argument can also be an array of objects, in which case every object in that array will be checked for

function collisionRectangleMulti(x1, y1, x2, y2)
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
		if isMovingPlatform(obj)
		{
			var inst = collisionRectangleMovingPlatform(x1, y1, x2, y2, obj);
			if inst >= 0
				return inst;
		}
		else
		{
			var inst = collision_rectangle(x1, y1, x2, y2, obj, false, false);
			if inst >= 0
				return inst;
		}
	}

	return noone;
}
