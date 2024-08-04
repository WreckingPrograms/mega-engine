// This script recreates instance_create from older versions of GameMaker.
// Define depth values for objects in initObjectDepths (if no depth value is assigned to an object, 0 is used by default).

// Note: instance_create_depth and instance_create_layer replace the old "instance_create" function in GMS2.
// However, I personally found it cumbersome to pass a depth value (or layer) for each intance create call,
// and would want objects to always have a consistent depth anyway.

function instanceCreate(xx, yy, obj)
{
	var objName = object_get_name(obj);
	var createDepth = struct_exists(global.objectDepths, objName) ? global.objectDepths[$ objName] : 0;
	return instance_create_depth(xx, yy, createDepth, obj);
}
