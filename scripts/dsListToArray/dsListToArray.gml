function dsListToArray(list, convertLists=false, convertMaps=false)
{
	var listLen = ds_list_size(list);
	var returnArray = array_create(listLen);
	
	for (var i = 0; i < listLen; i++)
	{
		if convertLists && ds_list_is_list(list, i)
			returnArray[i] = dsListToArray(list[| i], true, true);
		else if convertMaps && ds_list_is_map(list, i)
			returnArray[i] = dsMapToStruct(list[| i], true, true);
		else
			returnArray[i] = list[| i];
	}
		
	return returnArray;
}