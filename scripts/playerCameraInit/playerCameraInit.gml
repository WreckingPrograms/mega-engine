// Initialize the camera
// For the meanings of newSectionXOffset/newSectionYOffset, see playerSwitchSections
function playerCameraInit()
{
	var dist = 0;

	// Left
	for (dist = 0; dist <= 16 * 2000; dist += 16)
	{
		var sectionBorder = instance_place(floor((x + newSectionXOffset) / 16) * 16 - dist, y + newSectionYOffset, objSectionBorderLeft);
		if sectionBorder >= 0
		{
			sectionLeft = sectionBorder.x;
			break;
		}
	}
	
	if dist >= 16 * 2000
	{
	    show_message("Got stuck on left");
	}


	// Right
	for (dist = 0; dist <= 16 * 2000; dist += 16)
	{
		var sectionBorder = instance_place(ceil((x + newSectionXOffset) / 16) * 16 + dist, y + newSectionYOffset, objSectionBorderRight);
		if sectionBorder >= 0
		{
			sectionRight = sectionBorder.x + 16;
			break;
		}
	}

	if dist >= 16 * 2000
	{
	    show_message("Got stuck on right");
	}


	// Top
	for (dist = 0; dist <= 16 * 2000; dist += 16)
	{
		var sectionBorder = instance_place(x + newSectionXOffset, floor((y + newSectionYOffset) / 16) * 16 - dist, objSectionBorderTop);
		if sectionBorder >= 0
		{
			sectionTop = sectionBorder.y;
			break;
		}
	}

	if dist >= 16 * 2000
	{
	    show_message("Got stuck on top");
	}


	// Bottom
	for (dist = 0; dist <= 16 * 2000; dist += 16)
	{
		var sectionBorder = instance_place(x + newSectionXOffset, ceil((y + newSectionYOffset) / 16) * 16 + dist, objSectionBorderBottom);
		if sectionBorder >= 0
		{
			sectionBottom = sectionBorder.y + 16;
			break;
		}
	}

	if dist >= 16 * 2000
	{
	    show_message("Got stuck on bottom");
	}
}
