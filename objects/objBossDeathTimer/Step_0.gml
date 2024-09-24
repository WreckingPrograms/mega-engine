if isMM && !teleporting
{
    if !absorbing
    {
        var destX = round(global.viewX + (global.viewWidth / 2));
        
        checkGround();
        gravityCheckGround();
        generalCollision();
        
        if x < destX - 2 || x > destX + 2
        {
            if x < destX
            {
                xspeed = 1.296875;
                image_xscale = 1;
            }
            else if x > destX
            {
                xspeed = -1.296875;
                image_xscale = -1;
            }
            
            if ground && (place_meeting(x + (xspeed * 8), y, objSolid)
				|| placeMeetingMovingPlatform(x + (xspeed * 8), y, prtMovingPlatformSolid))
            {
                if (image_xscale == 1 && (position_meeting(bbox_right + (xspeed * 8), bbox_top, objSolid)
					|| positionMeetingMovingPlatform(bbox_right + (xspeed * 8), bbox_top, prtMovingPlatformSolid)))
                || (image_xscale == -1 && (position_meeting(bbox_left + (xspeed * 8), bbox_top, objSolid)
					|| positionMeetingMovingPlatform(bbox_left + (xspeed * 8), bbox_top, prtMovingPlatformSolid)))
				{
					// If we are blocked by a wall of at least 2 blocks high, perform a high jump
                    yspeed = -5.25;
				}
                else 
				{
					// Else, perform a short, 1-block-high jump
                    yspeed = -3.5;
				}
            }
            
            if ground 
                sprite_index = sprMegamanWalk;
            else
                sprite_index = sprMegamanJump;
                
                
            if !prevGround && ground 
                playSFX(sfxLand);
                
            prevGround = ground;
        }
        else
        {
            if canInitJump && ground 
            {
                if !global.weaponUnlocked[global.weaponID] // Only absorb the power if it's not already been unlocked
                {
                    canInitJump = false;
                    
                    x = destX;
                    sprite_index = sprMegamanJump;
                    yspeed = -8;
                    xspeed = 0;
                }
                else
                {
                    // Teleport out
                    yspeed = 0;
                    teleporting = true;
					delay(60, startFadeOut);
                    playSFX(sfxTeleportOut);
                    sprite_index = sprMegamanTeleport;
                }
            }
            
            if yspeed >= 0 && y >= global.viewY + 112 && !canInitJump && !global.weaponUnlocked[global.weaponID]
            {
                y = global.viewY + 112;
				yspeed = 0;
                absorbing = true;
            }
        }
        
        
        x += xspeed * global.dt;
        y += yspeed * global.dt;
    }
    else
    {
        // Absorbing the boss's power
        if !instance_exists(objAbsorbEffect)
        {
            if absorbAmount < 3
            {
                absorbAmount += 1;
                
                playSFX(sfxAbsorb);
                var fastSpd = 7;
                var slowSpd = 3;
				var radius = global.viewWidth / 2;
                var angle = 0;
                
                for (var angle = 0; angle < 360; angle += 45)
                {
                    var ID = instanceCreate(spriteGetXCenter() + lengthdir_x(radius, angle),
							spriteGetYCenter() + lengthdir_y(radius, angle), objAbsorbEffect);
                        ID.spd = fastSpd;
						
                    ID = instanceCreate(spriteGetXCenter() + lengthdir_x(radius, angle),
							spriteGetYCenter() + lengthdir_y(radius, angle), objAbsorbEffect);
                        ID.spd = slowSpd; 
                }
            }
            else
            {
                checkGround();
                gravityCheckGround();
                generalCollision();
                
                if ground 
                {
                    sprite_index = sprMegamanStand;
                    imgSpd = 0;
                    image_index = 0;
                    
                    startTeleportTimer += 1 * global.dt;
                    if startTeleportTimer >= 55
                    {
                        startTeleportTimer = 0;
                        yspeed = 0;
                        teleporting = true;
                        delay(60, startFadeOut);
                        playSFX(sfxTeleportOut);
                        sprite_index = sprMegamanTeleport;
                    }
                }
                
                y += yspeed * global.dt;
            }
        }
    }
	
	image_speed = imgSpd * global.dt;
}

