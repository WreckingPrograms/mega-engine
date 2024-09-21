event_inherited();

if !isFrozen()
{
    if isFight 
    {       
        checkGround();
        gravityCheckGround();
        generalCollision();
        
        switch phase
        {
            case 0: // Idle (standing still)
                sprite_index = sprPharaohStand;
                image_speed = 0;
                
                attackTimer -= 1;
                if attackTimer <= 0
                {
                    if attackTimer == -1 // It's -1 when first attacking; the first attack is always a jump 'n shoot
                        phase = 2;
                    else
                    {
                        phase = choose(1, 2, 3, 3); // There seems to be a higher chance of him shooting
                    }
                }
            break;
            
            
            
            case 1: // Jumping
                if attackTimer <= 0
                {
                    attackTimer = 35;
                    
                    if instance_exists(objMegaman)
                    {
                        startXScale = image_xscale;
						
						yspeed = -6.5;
						startXspeed = arcCalcXspeed(yspeed, 0.25, x, y, objMegaman.x, objMegaman.y);
                        ground = false;
                    }
                    else
                    {
                        startXScale = image_xscale;
                        startXspeed = 0;
                    }
                }
                
                if !place_meeting(x + startXspeed, y, objSolid) && !placeMeetingMovingPlatform(x + startXspeed, y, prtMovingPlatformSolid)
				{
                    xspeed = startXspeed;
				}
                else
                {
                    while place_meeting(x, y, objSolid) || placeMeetingMovingPlatform(x, y, prtMovingPlatformSolid)
						x -= image_xscale;
                            
                    xspeed = 0;
                }
                
                
                // Face the player
                if instance_exists(objMegaman)
                {
                    if startXScale == -1
                    {
                        if x > objMegaman.x
                            sprite_index = sprPharaohJump;
                        else
                            sprite_index = sprPharaohJumpBack;
                    }
                    else
                    {
                        if x > objMegaman.x
                            sprite_index = sprPharaohJumpBack;
                        else
                            sprite_index = sprPharaohJump;
                    }
                }
                
                
                // When grounded, end the jump
                if ground 
                {
                    phase = 0;
                    sprite_index = sprPharaohStand;
                    xspeed = 0;
                    yspeed = 0;
                }
            break;
            
            
            
            case 2: // Jumping 'n shooting
                if attackTimer <= 0
                {
                    attackTimer = 35;
                    jumpTimer = 0;
                    
                    startXScale = image_xscale;
                    yspeed = -5;
                    sprite_index = sprPharaohJump;
                    ground = false;
                }
                
                if sprite_index == sprPharaohJump || sprite_index == sprPharaohJumpBack
                {
                    jumpTimer += 1;
                    if jumpTimer >= 10
                    {
                        sprite_index = sprPharaohJumpShoot;
                        image_index = 0;
                        image_speed = 6 / 60;
                    }
                }
                else if sprite_index == sprPharaohJumpShoot || sprite_index == sprPharaohJumpShootBack
                {
                    if floor(image_index) == 1
                    {
                        if canInitShoot 
                        {
                            canInitShoot = false;
                            
                            var box;
                            if image_xscale == 1
                                box = bbox_right;
                            else
                                box = bbox_left;
                            
                            instanceCreate(box, y - 8, objPharaohManShot);
                        }
                        
                        image_speed = 6 / 60;
                    }
                    else if floor(image_index) == image_number - 1
                    {
                        image_index = image_number-1;
                        image_speed = 0;
                    }
                    else
                    {
                        image_speed = 6 / 60;
                    }
                }
                
                if !place_meeting(x + (startXScale * 2), y, objSolid)
					&& !placeMeetingMovingPlatform(x + (startXScale * 2), y, prtMovingPlatformSolid)
				{
                    xspeed = startXScale * 2;
				}
                else
                {
                    while place_meeting(x, y, objSolid) || placeMeetingMovingPlatform(x, y, prtMovingPlatformSolid)
                        x -= image_xscale;
                        
                    xspeed = 0;
                }
                    
                    
                // Either jump again or end the phase
                if ground 
                {
                    if jumpAmount == 0
                    {
                        sprite_index = sprPharaohJump;
                        jumpTimer = 0;
                        jumpAmount = 1;
                        canInitShoot = true;
                        yspeed = -5;
                    }
                    else
                    {
                        jumpAmount = 0;
                        canInitShoot = true;
                        phase = 0;
                        sprite_index = sprPharaohStand;
                        xspeed = 0;
                        yspeed = 0;
                    }
                }
                    
                    
                // Face the player
                if instance_exists(objMegaman)
                {
                    if startXScale == -1
                    {
                        if sprite_index == sprPharaohJump || sprite_index == sprPharaohJumpBack
                        {
                            if x > objMegaman.x
                                sprite_index = sprPharaohJump;
                            else
                                sprite_index = sprPharaohJumpBack;
                        }
                        else if sprite_index == sprPharaohJumpShoot || sprite_index == sprPharaohJumpShootBack
                        {
                            if x > objMegaman.x
                                sprite_index = sprPharaohJumpShoot;
                            else
                                sprite_index = sprPharaohJumpShootBack;
                        }
                    }
                    else
                    {
                        if sprite_index == sprPharaohJump || sprite_index == sprPharaohJumpBack
                        {
                            if x > objMegaman.x
                                sprite_index = sprPharaohJumpBack;
                            else
                                sprite_index = sprPharaohJump;
                        }
                        else if sprite_index == sprPharaohJumpShoot || sprite_index == sprPharaohJumpShootBack
                        {
                            if x > objMegaman.x
                                sprite_index = sprPharaohJumpShootBack;
                            else
                                sprite_index = sprPharaohJumpShoot;
                        }
                    }
                }
            break;
            
            
            
            case 3: // Shooting a big shot
                if attackTimer <= 0
                {
                    attackTimer = 35;
                    jumpTimer = 0;
                    
                    sprite_index = sprPharaohCharge;
                    image_speed = 0.25;
                    image_index = 0;
                }
                
                if sprite_index == sprPharaohCharge // This extra code is to make sure the animation resumes after pausing and unpausing
                    image_speed = 0.25;
                else if sprite_index == sprPharaohCharge2
                    image_speed = 0.07;
                else if sprite_index = sprPharaohCharge3
                    image_speed = 1;
                
                jumpTimer += 1; // It's not really a timer for jumping, but rather for releasing the shot; however, reusing this variable saves initializing a new one
                if jumpTimer >= 40
                {                    
                    if jumpTimer == 40
                    {
                        sprite_index = sprPharaohCharge2;
                        image_index = 0;
                        image_speed = 0.07;
                    }
                    else if jumpTimer == 60
                    {
                        sprite_index = sprPharaohCharge3;
                        image_index = 1;
                        image_speed = 1;
                    }
                    else if jumpTimer == 70
                    {
                        sprite_index = sprPharaohShoot;
                        
                        var shootID, box;
                        if image_xscale == 1
                            box = bbox_right + 10;
                        else
                            box = bbox_left - 10;
                            
                        shootID = instanceCreate(box, y + 2, objPharaohManShotBig);
                            shootID.image_xscale = image_xscale;
                    }
                    else if jumpTimer == 75
                    {
                        phase = 0;
                        sprite_index = sprPharaohStand;
                        xspeed = 0;
                        yspeed = 0;
                    }
                }
            break;
        }
        
        
        // Face the player
        if instance_exists(objMegaman)
        {
            if x > objMegaman.x
                image_xscale = -1;
            else
                image_xscale = 1;
        }
    }
}
else
{
    image_speed = 0;
}

