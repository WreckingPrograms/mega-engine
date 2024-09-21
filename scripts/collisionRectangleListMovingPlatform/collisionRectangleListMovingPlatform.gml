/// @description collisionRectangleListMovingPlatform(x1, y1, x2, y2, list, objects...)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param list
/// @param objects...

// Checks for collision with moving platforms, respecting their "dead" parameter
// Optionally, you can supply multiple objects to this function as the trailing arguments
// This function specifically can also check collision for other objects with no "dead" parameter

function collisionRectangleListMovingPlatform(x1, y1, x2, y2, list)
{
	for (var i = 5; i < argument_count; i++)
	{
		var tempList = ds_list_create();
		var len = collision_rectangle_list(x1, y1, x2, y2, argument[i], false, false, tempList, false);
		if argument[i] == prtMovingPlatformSolid || argument[i] == prtMovingPlatformJumpthrough
		{
			for (var n = 0; n < len; n++)
			{
				var movingPlatform = tempList[| n];
				if !movingPlatform.dead
					ds_list_add(list, tempList[| n]);
			}
		}
		else
		{
			for (var n = 0; n < len; n++)
				ds_list_add(list, tempList[| n]);
		}
		
		ds_list_destroy(tempList);
	}
}