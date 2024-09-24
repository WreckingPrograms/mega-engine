event_inherited();

if !isFrozen()
{
    if sprite_index == sprRushJet
    {
        if canJet  // Waiting for Megaman
        {
            if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - 1, objMegaman, false, false) >= 0
            {
                if instance_exists(objMegaman)
                {
                    if objMegaman.ground && objMegaman.bbox_bottom <= bbox_top && objMegaman.yspeed >= 0
                    {
                        canJet = false;
                    }
                }
            }
        }
        else // Flying
        {
            xspeed = spd * image_xscale;
            
            // Take away ammo
            decreaseAmmoTimer += 1 * global.dt;
            if decreaseAmmoTimer >= decreaseAmmoTimerMax
            {
                decreaseAmmoTimer = 0;
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                {
                    global.ammo[global.currentWeapon] = 0;
                    teleportAwayForce();
                }
            }
            
            if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top - 1, objMegaman, false, false) >= 0
            {               
                if instance_exists(objMegaman)
                {
                    if objMegaman.ground && objMegaman.bbox_bottom <= bbox_top && objMegaman.yspeed >= 0
                    {
                        // Set player properties
                        objMegaman.canMove = false;
                        objMegaman.xspeed = 0;
                        objMegaman.onRushJet = true;
                        
                        // Move vertically
                        if global.keyUp && !place_meeting(objMegaman.x, y - sprite_get_height(mskMegaman) - abs(yspeed * global.dt) - 1, objSolid)
							&& !place_meeting(x, y - abs(yspeed * global.dt) - 1, objSolid)
							&& !placeMeetingMovingPlatform(objMegaman.x, y - sprite_get_height(mskMegaman) - abs(yspeed * global.dt) - 1, prtMovingPlatformSolid)
							&& !placeMeetingMovingPlatform(x, y - abs(yspeed * global.dt) - 1, prtMovingPlatformSolid)
                        {
                            yspeed = -ySpd;
                        }
                        else if global.keyDown && !place_meeting(x, y + abs(yspeed * global.dt) + 1, objSolid)
							&& !place_meeting(x, y + abs(yspeed * global.dt) + 1, objTopSolid)
							&& !placeMeetingMovingPlatform(x, y + abs(yspeed * global.dt) + 1, prtMovingPlatformSolid, prtMovingPlatformJumpthrough)
                        {
                            yspeed = ySpd;
                        }
                        else
						{
                            yspeed = 0;
						}
                    }
                }
            }
            else
            {
                with objMegaman
                {
                    if onRushJet 
                    {
                        onRushJet = false;
                        canMove = true;
                    }
                }
                
                yspeed = 0;
            }
        }
        
        if place_meeting(x, y, objSolid) || placeMeetingMovingPlatform(x, y, prtMovingPlatformSolid)
        {
            teleportAwayForce();
        }
        
        image_speed = 0.25 * global.dt;
    }
}
else
{
    image_speed = 0;
}

