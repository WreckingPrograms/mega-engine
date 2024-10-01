/// @description instancePlaceListMovingPlatform(xx, yy, list, objects...)
/// @param x
/// @param y
/// @param list
/// @param objects...

// Checks for collision with moving platforms, respecting their "dead" parameter
// Optionally, you can supply multiple objects to this function as the trailing arguments
// This function specifically can also check collision for other objects with no "dead" parameter
// Each object argument can also be an array of objects, in which case every object in that array will be checked for

function instancePlaceListMovingPlatform(xx, yy, list)
{
	var objects = [];
	for (var i = 3; i < argument_count; i++)
	{
		if is_array(argument[i])
			objects = array_concat(objects, argument[i]);
		else
			array_push(objects, argument[i]);
	}
	
	for (var i = 0, len = array_length(objects); i < len; i++)
	{
		var obj = objects[i];
		var tempList = ds_list_create();
		var len2 = instance_place_list(xx, yy, obj, tempList, false);
		if isMovingPlatform(obj)
		{
			for (var n = 0; n < len2; n++)
			{
				var movingPlatform = tempList[| n];
				if !movingPlatform.dead
					ds_list_add(list, tempList[| n]);
			}
		}
		else
		{
			for (var n = 0; n < len2; n++)
				ds_list_add(list, tempList[| n]);
		}
		
		ds_list_destroy(tempList);
	}
}