function dsMapToStruct(map, convertLists=false, convertMaps=false)
{
	var struct = {};
	for (var key = ds_map_find_first(map); !is_undefined(key); key = ds_map_find_next(map, key))
	{
		if convertLists && ds_map_is_list(map, key)
			variable_struct_set(struct, key, dsListToArray(map[? key], true, true));
		else if convertMaps && ds_map_is_map(map, key)
			variable_struct_set(struct, key, dsMapToStruct(map[? key], true, true));
		else
			variable_struct_set(struct, key, map[? key]);
	}
	return struct;
}