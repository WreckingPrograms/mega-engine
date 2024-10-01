// Handles a general object's collision code
function generalCollision() 
{
	var mask = (mask_index == -1) ? sprite_index : mask_index;
	var isMovingPlat = isMovingPlatform();
	
	var mySolid, myPlatforms;

	// Floor
	if yspeed > 0
	{
		mySolid = instance_place(x, y + (yspeed * global.dt), objSolid);
		if mySolid >= 0
		{
			if isMovingPlat
			{
				move(0, mySolid.bbox_top - y - (sprite_get_bbox_bottom(mask) - sprite_get_yoffset(mask)) - 1);
			}
			else
			{
			    y = mySolid.bbox_top - (sprite_get_bbox_bottom(mask) - sprite_get_yoffset(mask)) - 1;
			}
		
		    ground = true;
		    yspeed = 0;
		}
	}


	// Wall
	if xspeed != 0
	{
		mySolid = instance_place(x + (xspeed * global.dt), y, objSolid);
		if mySolid >= 0
		{    
			if isMovingPlat
			{
				if xspeed < 0
					move(mySolid.bbox_right - x + (sprite_get_xoffset(mask) - sprite_get_bbox_left(mask)) + 1, 0);
				else
					move(mySolid.bbox_left - x - (sprite_get_bbox_right(mask) - sprite_get_xoffset(mask)) - 1, 0);
			}
			else
			{
			    if xspeed < 0
			        x = mySolid.bbox_right + (sprite_get_xoffset(mask) - sprite_get_bbox_left(mask)) + 1;
			    else
			        x = mySolid.bbox_left - (sprite_get_bbox_right(mask) - sprite_get_xoffset(mask)) - 1;
			}
        
		    xspeed = 0;
		}
	}

	// Ceiling
	if yspeed < 0
	{
		mySolid = instance_place(x, y + (yspeed * global.dt), objSolid);
		if mySolid >= 0
		{
			if isMovingPlat
			{
				move(0, mySolid.bbox_bottom - y + (sprite_get_yoffset(mask) - sprite_get_bbox_top(mask)) + 1);
			}
			else
			{
				y = mySolid.bbox_bottom + (sprite_get_yoffset(mask) - sprite_get_bbox_top(mask)) + 1;
			}
			
		    yspeed = 0;
		}
	}


	// Topsolids
	if yspeed > 0
	{
		mySolid = instance_place(x, y + (yspeed * global.dt), objTopSolid);
		if mySolid >= 0
		{
		    if bbox_bottom <= mySolid.bbox_top + (yspeed * global.dt) + 1
		    {
		        if isMovingPlat
				{
					move(0, mySolid.bbox_top - y - (sprite_get_bbox_bottom(mask) - sprite_get_yoffset(mask)) - 1);
				}
				else
				{
				    y = mySolid.bbox_top - (sprite_get_bbox_bottom(mask) - sprite_get_yoffset(mask)) - 1;
				}
			
		        ground = true;
		        yspeed = 0;
		    }
		}
	}


	// Floor (moving platform)
	if yspeed > 0
	{
		myPlatforms = [];
		instancePlaceArrayMovingPlatform(x, y + (yspeed * global.dt), myPlatforms, prtMovingPlatformSolid);
		if isMovingPlat
		{
			myPlatforms = array_filter(myPlatforms, function(el, index) {
				
				return !array_contains(movedByPlatformsThisFrame, el);
					
			});
		}
		
		if array_length(myPlatforms) > 0
		{
			array_sort(myPlatforms, function(el1, el2) { return el1.bbox_top - el2.bbox_top }); // Sort platforms from top to bottom
			var platform = myPlatforms[0];
			
			if isMovingPlat
			{
				move(0, platform.bbox_top - y - (sprite_get_bbox_bottom(mask) - sprite_get_yoffset(mask)) - 1);
			}
			else
			{
			    y = platform.bbox_top - (sprite_get_bbox_bottom(mask) - sprite_get_yoffset(mask)) - 1;
			}
		
		    ground = true;
		    yspeed = 0;
		}
	}


	// Wall (moving platform)
	if xspeed != 0
	{
		myPlatforms = [];
		instancePlaceArrayMovingPlatform(x + (xspeed * global.dt), y, myPlatforms, prtMovingPlatformSolid);
		if isMovingPlat
		{
			myPlatforms = array_filter(myPlatforms, function(el, index) {
				
				return !array_contains(movedByPlatformsThisFrame, el);
					
			});
		}
		
		if array_length(myPlatforms) > 0
		{			
			if xspeed > 0
			{
				// Sort platforms from left to right
				array_sort(myPlatforms, function(el1, el2) { return el1.bbox_left - el2.bbox_left });
			}
			else
			{
				// Sort platforms from right to left
				array_sort(myPlatforms, function(el1, el2) { return el2.bbox_right - el1.bbox_right });
			}
			
			var platform = myPlatforms[0];
			
			if isMovingPlat
			{
				if xspeed < 0
					move(platform.bbox_right - x + (sprite_get_xoffset(mask) - sprite_get_bbox_left(mask)) + 1, 0);
				else
					move(platform.bbox_left - x - (sprite_get_bbox_right(mask) - sprite_get_xoffset(mask)) - 1, 0);
			}
			else
			{
			    if xspeed < 0
			        x = platform.bbox_right + (sprite_get_xoffset(mask) - sprite_get_bbox_left(mask)) + 1;
			    else
			        x = platform.bbox_left - (sprite_get_bbox_right(mask) - sprite_get_xoffset(mask)) - 1;
			}
		
		    xspeed = 0;
		}
	}


	// Ceiling (moving platform)
	if yspeed < 0
	{	
		myPlatforms = [];
		instancePlaceArrayMovingPlatform(x, y + (yspeed * global.dt), myPlatforms, prtMovingPlatformSolid);
		if isMovingPlat
		{
			myPlatforms = array_filter(myPlatforms, function(el, index) {
				
				return (!isMovableObject(el.object_index) && !array_contains(movedByPlatformsThisFrame, el));
					
			});
		}
			
		if array_length(myPlatforms) > 0
		{			
			array_sort(myPlatforms, function(el1, el2) { return el2.bbox_bottom - el1.bbox_bottom }); // Sort platforms from bottom to top
			var platform = myPlatforms[0];
			
			if isMovingPlat
			{
				move(0, platform.bbox_bottom - y + (sprite_get_yoffset(mask) - sprite_get_bbox_top(mask)) - 1);
			}
			else
			{
			    y = platform.bbox_bottom + (sprite_get_yoffset(mask) - sprite_get_bbox_top(mask)) - 1;
			}
		
		    ground = true;
		    yspeed = 0;
		}
	}


	// Topsolids (moving platform)
	mySolid = instance_place(x, y+(yspeed * global.dt), prtMovingPlatformJumpthrough);
	if mySolid >= 0 && yspeed > 0
	{
	    if mySolid.object_index != objRushJet
	    {
	        if !place_meeting(x, y, mySolid)
	        {
	            y = mySolid.bbox_top - (bbox_bottom+1 - y);
	            ground = true;
	            yspeed = 0;
	        }
	    }
	}


}
