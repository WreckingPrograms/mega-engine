event_inherited();

if global.frozen == false && dead == false
{
    switch phase
    {
        //Idle
        case 0:
            if place_meeting(x, y-1, objMegaman)
            {
                if objMegaman.ground == true && objMegaman.bbox_bottom <= bbox_top+global.yspeed
                && collision_rectangle(objMegaman.bbox_left, objMegaman.bbox_bottom, objMegaman.bbox_right, objMegaman.bbox_bottom+1, prtMovingPlatformSolid, false, true) < 0
                && collision_rectangle(objMegaman.bbox_left, objMegaman.bbox_bottom, objMegaman.bbox_right, objMegaman.bbox_bottom+1, prtMovingPlatformJumpthrough, false, true) < 0
                {
                    phase = 1;
                    timer = 0;
                }
            }
        break;
        
        
        //Preparing to drop down
        case 1:
            timer += 1;
            if timer >= dropTimerMax
            {
                timer = 0;
                phase = 2;
            }
        break;
        
        
        //Dropping down animation
        case 2:
            timer += 1;
            if timer mod 3 == 1
            {
                image_index += 1;
                if image_index == 4
                {
                    with topSolidID instance_destroy();
                    phase = 3;
                    timer = 0;
                }
            }
        break;
        
        
        //Dropped down
        case 3:
            timer += 1;
            if timer >= rebuildTimerMax
            {
                timer = 0;
                phase = 4;
            }
        break;
        
        
        //Rebuilding animation
        case 4:
            timer += 1;
            if timer == 1
            {
                topSolidID = instance_create(x-16, y, objTopSolid);
                    topSolidID.image_xscale = 2;
            }
            
            if timer mod 3 == 1
            {
                image_index -= 1;
                if image_index == 0
                {
                    timer = 0;
                    phase = 0;
                }
            }
        break;
    }
}

