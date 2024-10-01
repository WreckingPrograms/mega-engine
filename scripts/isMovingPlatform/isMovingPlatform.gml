function isMovingPlatform(obj=undefined)
{
	if is_undefined(obj)
		obj = object_index;
		
	return (object_is_ancestor(obj, prtMovingPlatformSolid)
		|| object_is_ancestor(obj, prtMovingPlatformJumpthrough));
}