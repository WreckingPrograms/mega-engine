// Handles moving platform collision
function playerMovingPlatform()
{
	// Not changing any of this now because collision will be rewritten
	
	return;

	// Jumpthrough moving platforms
	mySolid = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+(yspeed * global.dt)+1, prtMovingPlatformJumpthrough, false, true)
	if mySolid >= 0
	{
	    if yspeed > 0 && (mySolid.id == movedPlatformID || movedPlatformID == noone)
	    {
	        if !mySolid.dead
	        {
	            if !place_meeting(x, y, mySolid)
	            {
	                y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	                yspeed = 0;
                
	                ground = true;
	                if playLandSound 
	                    playSFX(sfxLand);
	            }
	        }
	    }
	}


	// Floor (moving platforms)
	var maxID;
	maxID = -1;
	while place_meeting(x, y+(yspeed * global.dt), prtMovingPlatformSolid) /*&& yspeed >= 0*/ && !place_meeting(x, y, prtMovingPlatformSolid)
	&& collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+(yspeed * global.dt)+1, prtMovingPlatformSolid, false, false) >= 0
	{
	    maxID += 1;
	    ID[maxID] = instance_place(x, y+(yspeed * global.dt), prtMovingPlatformSolid);
	    if !ID[maxID].dead
	    {
	        y = ID[maxID].bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	        yspeed = 0;
        
	        ground = true;
	        if playLandSound 
	            playSFX(sfxLand);
	    }
    
	    instance_deactivate_object(ID[maxID]);
	}

	var i;
	for (i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}


	// Wall (moving platforms)
	maxID = -1;
	var pltfm;
	pltfm = collision_rectangle(bbox_left+(xspeed * global.dt), bbox_top, bbox_right+(xspeed * global.dt), bbox_bottom-4, prtMovingPlatformSolid, false, false);
	while pltfm >= 0 && xspeed != 0
	&& collision_rectangle(bbox_left+4, bbox_bottom, bbox_right-4, bbox_bottom+3, pltfm, false, false) < 0
	{
	    maxID += 1;
	    ID[maxID] = pltfm;
	    if !ID[maxID].dead
	    {
	        if xspeed < 0 && ID[maxID].xspeed >= 0
	        {
	            x = ID[maxID].bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
	            while place_meeting(x, y, ID[maxID])
	                x += 1;
	        }
	        else if xspeed > 0 && ID[maxID].xspeed <= 0
	        {
	            x = ID[maxID].bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
	            while place_meeting(x, y, ID[maxID])
	                x -= 1;
	        }
            
	        xspeed = 0;
	    }
    
	    instance_deactivate_object(ID[maxID]);
	    pltfm = collision_rectangle(bbox_left+(xspeed * global.dt), bbox_top, bbox_right+(xspeed * global.dt), bbox_bottom-4, prtMovingPlatformSolid, false, false);
	}

	for (i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}


	// Ceiling (moving platforms)
	maxID = -1;
	while place_meeting(x, y+(yspeed * global.dt)+sign(yspeed), prtMovingPlatformSolid) && yspeed < 0 && !place_meeting(x, y, prtMovingPlatformSolid)
	{
	    maxID += 1;
	    ID[maxID] = instance_place(x, y+(yspeed * global.dt)+sign(yspeed), prtMovingPlatformSolid);
	    if !ID[maxID].dead && yspeed <= ID[maxID].yspeed
	    {
	        y = ID[maxID].bbox_bottom + sprite_get_yoffset(mask_index);
	        if ID[maxID].yspeed == 0
	            yspeed = 0;
	        else
	            yspeed = ID[maxID].yspeed + 0.5;
	    }
    
	    instance_deactivate_object(ID[maxID]);
	}

	for (i = 0; i <= maxID; i += 1)
	{
	    instance_activate_object(ID[i]);
	}


}
