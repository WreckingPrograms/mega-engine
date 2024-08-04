// /More stable moving platform code!

event_inherited();

if !global.frozen && !dead
{
    x += xspeed;
    y += yspeed;
    
    
    //  If the player is standing on us, move them
    var checkYspeed;
    if yspeed > 0
        checkYspeed = yspeed;
    else
        checkYspeed = 0;
        
    if place_meeting(x, y - checkYspeed - 1, objMegaman)
    {
        var useYspeed;
        useYspeed = yspeed;
        
        var canProceed;
        canProceed = false;
        if objMegaman.movedPlatformID == id || objMegaman.movedPlatformID == -20
            canProceed = true;
        else if objMegaman.movedPlatformID.yspeed == useYspeed && abs(objMegaman.movedPlatformID.bbox_top - bbox_top) <= useYspeed + 3
            canProceed = true;
            
        if objMegaman.ground  && objMegaman.bbox_bottom <= bbox_top + abs(yspeed) + abs(objMegaman.yspeed) + 2
        && !objMegaman.movedByPlatform && canProceed 
        {
            with objMegaman
            {
                var proceed, xsp, ysp;
                proceed = true;
                xsp = other.xspeed;
                ysp = other.yspeed;
                
                if place_meeting(x + xsp, y + ysp, objSolid) || place_meeting(x + xsp, y + ysp, prtMovingPlatformSolid)
                    proceed = false;
                
                if proceed 
                {
                    movedByPlatform = true;
                    
                    if movedPlatformID == -20
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