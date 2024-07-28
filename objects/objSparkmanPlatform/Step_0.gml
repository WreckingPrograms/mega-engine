event_inherited();

if global.frozen == false && dead == false
{
    if place_meeting(x, y-1, objMegaman) && !place_meeting(x-1, y, objMegaman) && !place_meeting(x+1, y, objMegaman)
    {
        if objMegaman.ground == true && phase == 0
        {
            phase = 1;
        }
    }
    
    if phase == 1 //Moving up
    {
        yspeed = 0;
            
        subYspeed -= acc;
        
        if subYspeed < -maxSpeed
            subYspeed = -maxSpeed;
        else if subYspeed > maxSpeed
            subYspeed = maxSpeed;
            
        subY += subYspeed;
        
        while subY >= 1
        {
            subY -= 1;
            yspeed += 1;
        }
        
        while subY <= -1
        {
            subY += 1;
            yspeed -= 1;
        }
        
        
        
        if place_meeting(x, y, objSolid) || place_meeting(x, y, objSpike) || place_meeting(x, y, objSparkmanPlatformStop)
        {
            y = round(y);
            
            var yy;
            yy = 0;
            while place_meeting(x, y, objSolid) || place_meeting(x, y, objSpike) || place_meeting(x, y, objSparkmanPlatformStop)
            {
                y += 1;
                yy += 1;
            }
            
            if place_meeting(x, y-yy-1, objMegaman)
                objMegaman.y = bbox_top-16;
            
            subYspeed = 0;
            subY = 0;
            phase = 2;
        }
    }
    else if phase == 2 //Moving down
    {
        yspeed = decendSpeed;
        y = round(y);
        
        if y >= ystart
        {
            y = ystart;
            yspeed = 0;
            phase = 0;
        }
    }
}
else
{
    if dead == true
    {
        phase = 0;
        xspeed = 0;
        yspeed = 0;
        subYspeed = 0;
    }
}

