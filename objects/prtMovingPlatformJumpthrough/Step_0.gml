// More stable moving platform code!

// Not rewriting this now. Collision rewrite pending

event_inherited();

if !isFrozen() && !dead
{
	var useXspeed = xspeed * global.dt;
	var useYspeed = yspeed/* * global.dt*/; // global.dt causes problems because yspeed can only be whole numbers right now. Should hopefully resolve itself with new moving platform code

    x += useXspeed;
    y += useYspeed;
    
    
    //  If the player is standing on us, move them
    var checkYspeed;
    if useYspeed > 0
        checkYspeed = useYspeed;
    else
        checkYspeed = 0;
        
    if place_meeting(x, y - checkYspeed - 1, objMegaman)
    {        
        var canProceed = false;
        if objMegaman.movedPlatformID == id || objMegaman.movedPlatformID == noone
		{
            canProceed = true;
		}
        else if objMegaman.movedPlatformID.yspeed * global.dt == useYspeed
			&& abs(objMegaman.movedPlatformID.bbox_top - bbox_top) <= useYspeed + 3
		{
            canProceed = true;
		}
            
        if objMegaman.ground && objMegaman.bbox_bottom <= bbox_top + abs(useYspeed) + abs(objMegaman.yspeed * global.dt) + 2
			&& !objMegaman.movedByPlatform && canProceed 
        {
            with objMegaman
            {
                var proceed, xsp, ysp;
                proceed = true;
                xsp = useXspeed;
                ysp = useYspeed;
                
                if place_meeting(x + xsp, y + ysp, objSolid) || place_meeting(x + xsp, y + ysp, prtMovingPlatformSolid)
                    proceed = false;
                
                if proceed 
                {
                    movedByPlatform = true;
                    
                    if movedPlatformID == noone
                        movedPlatformID = other.id;
                        
                    x += xsp;
                    y += ysp;
                    y = round(y);
                    
                    if ysp < 0
                    {
                        var origY, attempts;
                        origY = y;
                        attempts = 0;
                        while !place_meeting(x, y + 1, other.id) && attempts < 100
                        {
                            y += 1;
                            attempts += 1;
                        }
                        
                        if attempts >= 100
                            y = origY;
                    }
                    
                    var origY, attempts;
                    origY = y;
                    attempts = 0;
                    while place_meeting(x, y, other.id) && attempts < 100
                    {
                        y -= 1;
                        attempts += 1;
                    }
                    
                    if attempts >= 100
                        y = origY;
                    
                    ground = true;
                }
            }
        }
    }
}