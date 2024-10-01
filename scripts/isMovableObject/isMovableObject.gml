function isMovableObject(obj=undefined)
{
	if is_undefined(obj)
		obj = object_index;
		
	for (var i = 0, len = array_length(global.movableObjects); i < len; i++)
	{
		if obj == global.movableObjects[i] || object_is_ancestor(obj, global.movableObjects[i])
			return true;
	}
	
	return false;
}