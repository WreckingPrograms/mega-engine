// / @function playerCollision
// / @description Handles the player's collision code
function playerCollision() {


	// Floor
	var mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 && yspeed > 0
	{
	    y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	    ground = true;
	    yspeed = 0;
    
	    if playLandSound 
	        playSFX(sfxLand);
    
	    // Note: there used to be a system here that set MM's sprite to the walking sprite when landing
	    // However, due to complications such as climbing up ladders, it was a lot of work for such a minor feature
	    // Therefore, it has been removed
	}


	// Wall
	mySolid = instance_place(x+xspeed, y, objSolid);
	if mySolid >= 0 && xspeed != 0
	{
	    if xspeed < 0
	    {
	        x = mySolid.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index);
        
	        // For some reason, the code above would work correctly half the time, but clip MM inside the wall the other half
	        // This while-loop fixes the issue by forcing MM out of the wall
	        while place_meeting(x, y, mySolid)
	            x += 1;
	    }
	    else
	        x = mySolid.x - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
        
	    xspeed = 0;
	}


	// Ceiling
	mySolid = instance_place(x, y+yspeed, objSolid);
	if mySolid >= 0 && yspeed < 0
	{
		y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index);
    
	    // For some reason, the code above would work correctly half the time, but clip MM inside the ceiling the other half
	    // This while-loop fixes the issue by forcing MM out of the ceiling
	    while place_meeting(x, y, mySolid)
	        y += 1;
		
	    yspeed = 0;
	}


	// Topsolids
	mySolid = instance_place(x, y+yspeed, objTopSolid);
	if mySolid >= 0 && yspeed > 0
	{
	    if !place_meeting(x, y, mySolid)
	    {
	        y = mySolid.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
	        ground = true;
	        yspeed = 0;
        
	        if playLandSound 
	            playSFX(sfxLand);
	    }
	}


	// Spikes
	if !instance_exists(objSectionSwitcher)
	{
	    // Lots of extra checks to make solid collision take priority over spike collision
	    // What this means is that when jumping on a solid and spike at the same time, you won't die, unlike in Mega Engine 1.5
	    var wallOffset = 0;
	    if global.keyRight
	        wallOffset = 1;
	    else if global.keyLeft
	        wallOffset = -1;
        
	    var yDeduct;
	    if !isSlide
	        yDeduct = sprite_get_bbox_top(mask_index);
	    else
	        yDeduct = 0;
        
	    // See if there are any solids (since spikes are also solid, we need to deactivate them first)
	    instance_deactivate_object(objSpike);
	    var onGround, onWall, onCeiling;
	    onGround = place_meeting(x, y+yspeed+1, objSolid); // This is to make sure spikes directly next to floors are more fair (as in, you won't die immediately when touching them)
	    onWall = place_meeting(x+xspeed+sign(xspeed) + wallOffset, y, objSolid);
	    onCeiling = place_meeting(x, y+yspeed-1 - yDeduct, objSolid);
	    instance_activate_object(objSpike);
        
	    if yspeed != jumpSpeed
	        mySpikeFloor = instance_position(x, bbox_bottom+yspeed+1, objSpike);
	    else
	        mySpikeFloor = instance_position(x, bbox_bottom+abs(yspeed)+1, objSpike);
	    mySpikeFloorLeft = instance_position(bbox_left, bbox_bottom+yspeed+1, objSpike);
	    mySpikeFloorRight = instance_position(bbox_right, bbox_bottom+yspeed+1, objSpike);
    
	    mySpikeWall = instance_place(x+xspeed+sign(xspeed) + wallOffset, y, objSpike);
    
	    mySpikeCeiling = instance_place(x, y+yspeed-1 - yDeduct, objSpike);
    
	    if (((mySpikeFloor >= 0 || mySpikeFloorLeft >= 0 || mySpikeFloorRight >= 0) && !onGround)
	     || (mySpikeWall >= 0 && !onWall) || (mySpikeCeiling >= 0 && !onCeiling)) && canHit 
	    {
	        global._health = 0;
	        exit;
	    }
	}


}
