event_inherited();

if global.frozen == false
{
    if sprite_index == sprRushJet
    {
        if canJet == true //Waiting for Megaman
        {
            if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top-1, objMegaman, false, false) >= 0
            {
                if instance_exists(objMegaman)
                {
                    if objMegaman.ground == true && objMegaman.bbox_bottom <= bbox_top && global.yspeed >= 0
                    {
                        canJet = false;
                        alarm[0] = -1;
                    }
                }
            }
        }
        else //Flying
        {
            xspeed = spd * image_xscale;
            
            //Take away ammo
            decreaseAmmoTimer += 1;
            if decreaseAmmoTimer >= decreaseAmmoTimerMax
            {
                decreaseAmmoTimer = 0;
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                {
                    global.ammo[global.currentWeapon] = 0;
                    event_perform(ev_alarm, 0);
                }
            }
            
            if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top-1, objMegaman, false, false) >= 0
            {               
                if instance_exists(objMegaman)
                {
                    if objMegaman.ground == true && objMegaman.bbox_bottom <= bbox_top && global.yspeed >= 0
                    {
                        //Set player properties
                        objMegaman.canMove = false;
                        global.xspeed = 0;
                        objMegaman.onRushJet = true;
                        
                        //Move vertically
                        if global.keyUp && !place_meeting(objMegaman.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, objSolid)
                        && !place_meeting(x, y-abs(yspeed)-1, objSolid)
                        {
                            if !place_meeting(objMegaman.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid)
                            && !place_meeting(x, y-abs(yspeed)-1, prtMovingPlatformSolid)
                                yspeed = -ySpd;
                            else if place_meeting(objMegaman.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid)
                            {
                                if instance_place(objMegaman.x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid).dead == true
                                    yspeed = -ySpd;
                                else
                                    yspeed = 0;
                            }
                            else
                            {
                                if instance_place(x, y-sprite_get_height(mskMegaman)-abs(yspeed)-1, prtMovingPlatformSolid).dead == true
                                    yspeed = -ySpd;
                                else
                                    yspeed = 0;
                            }
                        }
                        else if global.keyDown && !place_meeting(x, y+abs(yspeed)+1, objSolid) && !place_meeting(x, y+abs(yspeed)+1, objTopSolid)
                        {
                            if !place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformSolid) && !place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformJumpthrough)
                                yspeed = ySpd;
                            else if place_meeting(x, y+abs(yspeed)+1, prtMovingPlatformSolid)
                            {
                                if instance_place(x, y+abs(yspeed)+1, prtMovingPlatformSolid).dead == true
                                    yspeed = ySpd;
                                else
                                    yspeed = 0;
                            }
                            else
                            {
                                if instance_place(x, y+abs(yspeed)+1, prtMovingPlatformJumpthrough).dead == true
                                    yspeed = ySpd;
                                else
                                    yspeed = 0;
                            }
                        }
                        else
                            yspeed = 0;
                    }
                }
            }
            else
            {
                with objMegaman
                {
                    if onRushJet == true
                    {
                        onRushJet = false;
                        canMove = true;
                    }
                }
                
                yspeed = 0;
            }
        }
        
        if place_meeting(x, y, objSolid)
        {
            event_perform(ev_alarm, 0);
        }
        else if place_meeting(x, y, prtMovingPlatformSolid)
        {
            if instance_place(x, y, prtMovingPlatformSolid).dead == false
                event_perform(ev_alarm, 0);
        }
        
        image_speed = 0.25;
    }
}
else
{
    image_speed = 0;
    if alarm[0] != -1
        alarm[0] += 1;
}
