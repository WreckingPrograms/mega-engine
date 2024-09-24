// Handles general step event code for the player
function playerStep()
{
	// Check for ground
	var prevGround = ground;
	var solidBelow = instance_place(x, y + (yspeed * global.dt) + 1, objSolid);
	var topSolidBelow = instance_place(x, y + (yspeed * global.dt) + 1, objTopSolid);
	var movingPlatformJumpthroughBelow = placeMeetingMovingPlatform(x, y + (yspeed * global.dt) + 1, prtMovingPlatformJumpthrough);
	var movingPlatformSolidBelow = placeMeetingMovingPlatform(x, y + (yspeed * global.dt) + 1, prtMovingPlatformSolid);
	var movingPlatformSolidInside = placeMeetingMovingPlatform(x, y, prtMovingPlatformSolid);
	if solidBelow || (topSolidBelow && yspeed >= 0) || (movingPlatformJumpthroughBelow && yspeed >= 0)
		|| (movingPlatformSolidBelow && !movingPlatformSolidInside)
	{
	    var endCheck = false;
    
	    // We are only on the ground if the moving platform is not 'dead' (despawned and ready to respawn)
	    if solidBelow
	    {
	        ground = true;
	        endCheck = true;
	    }
    
	    if topSolidBelow && !endCheck
	    {
	        ground = (bbox_bottom <= topSolidBelow.bbox_top);
			endCheck = true;
	    }
    
		// Check for jumpthrough moving platforms
		var platformList = ds_list_create();
		if !endCheck
		{
			var totalPlatforms = collision_rectangle_list(bbox_left, bbox_bottom + (yspeed * global.dt), bbox_right,
				bbox_bottom + (yspeed * global.dt) + 1, prtMovingPlatformJumpthrough, false, true, platformList, false);
			for (var i = 0; i < totalPlatforms; i++)
			{				
				var pltfm = platformList[| i];
				if pltfm.id == movedPlatformID || movedPlatformID == noone
		        {
		            if !pltfm.dead
		            {
		                if bbox_bottom <= pltfm.bbox_top
		                {
		                    ground = true;
		                    endCheck = true;
		                }
		                else
		                    ground = false;
		            }
		            else
					{
		                ground = false;
					}
                
		            break;
		        }
			}
		}
		
		// Check for solid moving platforms
		if !endCheck
		{
			ds_list_clear(platformList);
			totalPlatforms = instance_place_list(x, y + (yspeed * global.dt) + 1, prtMovingPlatformSolid, platformList, false);
			
			for (var i = 0; i < totalPlatforms; i++)
			{
				var pltfm = platformList[| i];
				if !pltfm.dead
					ground = true;
			}
		}
		
		ds_list_destroy(platformList);
	}
	else
	{
	    ground = false;
	    if prevGround 
	        y += 1; // To make Mega Man able to fall through 1-block wide gaps
	}


	// Can we do a short hop? (Placed earlier in the code to fix the 'jump on the frame you land and you can't do a short hop' bug
	if ground || !canGravity
	    canMinJump = true;


	// Should the landing sound be played when colliding with a floor? (Disabled on ladders, for example)
	// Lasts two frames because one extra frame is required for the collision to register
	if playLandSoundTimer < 2
	{
	    playLandSoundTimer += 1 * global.dt;
	}
	else
	{
	    playLandSound = true;
	}


	// Movement (includes initializing sidestep while on the ground)
	if canMove 
	{
	    if ground 
	    {
			var horDir = (global.keyRight ? 1 : 0) + (global.keyLeft ? -1 : 0);
	        if horDir != 0
	        {
				var checkAhead = horDir * max(abs(horDir) * global.dt, 1); // Look further ahead at low FPS, but always at least one pixel
			
				// Moving horizontally
	            if canInitStep 
	            {
	                canInitStep = false;
	                isStep = true;
	                image_xscale = horDir;
	            }
	            else if !isStep
	            {
	                if !(place_meeting(x, y + 1, objIce) && sign(xspeed) == -horDir)
	                {
	                    // Normal physics
	                    if !place_meeting(x + checkAhead, y, objSolid) && !placeMeetingMovingPlatform(x + checkAhead, y, prtMovingPlatformSolid)
						{
	                        xspeed = walkSpeed * horDir;
						}
	                }
	                else
	                {
	                    // Ice physics
	                    if !place_meeting(x + checkAhead, y, objSolid) && !placeMeetingMovingPlatform(x + checkAhead, y, prtMovingPlatformSolid)
						{
	                        xspeed += iceDecWalk * horDir * global.dt;
						}
	                }
                    
	                image_xscale = horDir;
                            
	                if canSpriteChange 
	                {
	                    sprite_index = spriteWalk;
	                    image_speed = 0.15 * global.dt;
	                }
	            }
	        }
			else
			{
	            if !(place_meeting(x, y + 1, objIce) && xspeed != 0)
	            {
	                // Normal physics
	                xspeed = 0;
	                canInitStep = true;
	            }
	            else
	            {
	                // Ice physics
	                if xspeed > 0
	                    xspeed -= iceDec * global.dt;
	                else if xspeed < 0
	                    xspeed += iceDec * global.dt;
                    
	                if xspeed > -iceDec * global.dt && xspeed < iceDec * global.dt
	                    xspeed = 0;
	            }
            
	            if global.keyLeft && !global.keyRight
	                image_xscale = -1;
	            else if global.keyRight && !global.keyLeft
	                image_xscale = 1;
            
	            if canSpriteChange
	            {
	                sprite_index = spriteStand;
	                image_speed = 0;
	                image_index = blinkImage;
	            }
			}
	    }
	    else
	    {
	        canInitStep = false;
	        isStep = false;
        
	        if canSpriteChange 
	            sprite_index = spriteJump;
				
			var checkAhead = max(global.dt, 1);
            
	        if global.keyLeft && !global.keyRight && !place_meeting(x - checkAhead, y, objSolid)
				&& !placeMeetingMovingPlatform(x - checkAhead, y, prtMovingPlatformSolid)
	        {
				xspeed = -walkSpeed;
	            image_xscale = -1;
	        }
	        else if global.keyRight && !global.keyLeft
				&& !place_meeting(x + checkAhead + ((prevXScale == -1) ? checkAhead : 0), y, objSolid)
				&& !placeMeetingMovingPlatform(x + checkAhead + ((prevXScale == -1) ? checkAhead : 0), y, prtMovingPlatformSolid) // For some reason, while on the left of the wall and facing left, then jumping and holding right would clip you through it. Prevented by checking if the player was facing left on the previous frame, and if so, disallow Mega Man to move if 2 pixels away from the wall instead of 1
	        {
				xspeed = walkSpeed;
	            image_xscale = 1;
	        }
	        else
	        {
	            xspeed = 0;
            
	            if global.keyLeft && !global.keyRight
	                image_xscale = -1;
	            else if global.keyRight && !global.keyLeft
	                image_xscale = 1;
	        }
	    }
	}
	else if canSpriteChange 
	{
	    // Even if canMove is false, we should still be able to change sprites
	    if ground 
	    {
	        if xspeed == 0
	        {
	            sprite_index = spriteStand;
	            image_index = blinkImage;
	            image_speed = 0;
	        }
	        else
	        {
	            sprite_index = spriteWalk;
	            image_speed = 0.15 * global.dt;
	        }
	    }
	    else
	    {
	        sprite_index = spriteJump;
	    }
	}


	// Blinking animation
	if sprite_index == sprMegamanStand // Don't use spriteStand as this could also be sprMegamanStandShoot!
	{
	    if blinkImage == 0
	    {
	        blinkTimer += 1 * global.dt;
	        if blinkTimer >= blinkTimerMax
	        {
	            blinkImage = 1;
	            blinkTimer = 0;
	        }
	    }
	    else
	    {
	        blinkTimer += 1 * global.dt;
	        if blinkTimer >= blinkDuration
	        {
	            blinkImage = 0;
	            blinkTimer = 0;
	        }
	    }
	}
	else
	{
	    blinkTimer = 0;
	    blinkImage = 0;
	}


	// Sidestepping
	if isStep 
	{
	    if !place_meeting(x + image_xscale, y, objSolid) && !placeMeetingMovingPlatform(x + image_xscale, y, prtMovingPlatformSolid)
		{
	        xspeed = stepSpeed * image_xscale;
		}
    
	    if canSpriteChange 
	        sprite_index = spriteStep;
    
	    stepTimer += 1 * global.dt;
	    if stepTimer >= stepFrames
	    {
	        isStep = false;
	        stepTimer = 0;
	    }
	}


	// Move
	x += xspeed * global.dt;
	y += yspeed * global.dt;


	// Stop movement at section borders
	var sectionBufferHor = 6; // How far away from sections the player must be
	if x > sectionRight - sectionBufferHor && !place_meeting(x + sectionBufferHor, y, objSectionArrowRight)
		&& !place_meeting(x - (xspeed * global.dt), y, objSectionArrowRight)
	{
	    x = sectionRight - sectionBufferHor;
	    xspeed = 0;
	}
	else if x < sectionLeft + sectionBufferHor && !place_meeting(x - sectionBufferHor, y, objSectionArrowLeft)
		&& !place_meeting(x - (xspeed * global.dt), y, objSectionArrowLeft)
	{
	    x = sectionLeft + sectionBufferHor;
	    xspeed = 0;
	}
    
	var sectionBufferTop = 32;
	if y < sectionTop - sectionBufferTop
	{
	    y = sectionTop - sectionBufferTop;
	}
	else if bbox_top > sectionBottom && !place_meeting(x, y, objSectionArrowDown)
	{
	    global._health = 0;
	    deathByPit = true;
	}
    
    
	// Stop movement at room borders
	if x > room_width - sectionBufferHor
	    x = room_width - sectionBufferHor;
	else if x < sectionBufferHor
	    x = sectionBufferHor;
    
	if y < -sectionBufferTop
	{
	    y = -sectionBufferTop;
	}
	else if bbox_top > room_height
	{
	    global._health = 0;
	    deathByPit = true;
	}


	// Jumping
	if (canMove || isThrow || onRushJet) && ground && global.keyJumpPressed && !global.keyDown
	{
	    if isThrow // We can jump-cancel the throwing animation (after throwing a Metal Blade, Pharaoh Shot etc)
	    {
	        canMove = true;
	        canSpriteChange = true;
	        shootTimer -= 5; // 20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
	    }
	    else if onRushJet 
	    {
	        canMove = true;
	    }
    
	    yspeed = -currentJumpSpeed;
	    ground = false;
	    y -= 1; // To negate the prevGround y += 1
	    sprite_index = spriteJump;
	}


	// Minjumping (lowering jump when the jump button is released)
	if !ground && yspeed < 0 && !global.keyJump && canMinJump 
	{
	    canMinJump = false;
	    yspeed = 0;
	}


	// Sliding
	var box = (image_xscale == 1) ? bbox_right : bbox_left;
	if global.enableSlide 
	{
	    if ground && prevGround // Only slide if grounded on the frame before; would cause jank otherwise
			&& !isSlide && ((global.keyJumpPressed && global.keyDown) || global.keySlidePressed)
			&& (canMove || isThrow)
			&& !position_meeting(box + (image_xscale * 5), bbox_bottom - 8, objSolid)
			&& !positionMeetingMovingPlatform(box + (image_xscale * 5), bbox_bottom - 8, prtMovingPlatformSolid)
	    {
	        if isThrow 
	        {
	            isThrow = false;
	            shootTimer -= 5; // 20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
	        }
            
	        isSlide = true;
	        canMove = false;
	        canSpriteChange = false;
	        sprite_index = spriteSlide;
	        mask_index = mskMegamanSlide;
            
	        if image_xscale == -1
			{
	            with instanceCreate(bbox_right - 2, bbox_bottom - 2, objSlideDust)
					image_xscale = -1;
			}
	        else
			{
	            instanceCreate(bbox_left + 2, bbox_bottom - 2, objSlideDust);
			}
            
	        while place_meeting(x, y, objSolid) || placeMeetingMovingPlatform(x, y, prtMovingPlatformSolid)
	        {                
	            x += image_xscale;
	        }
            
	        xspeed = slideSpeed * image_xscale;
	    }
    
    
	    // While sliding
	    if isSlide 
	    {
	        isStep = false;
	        canInitStep = false;
	        slideTimer += 1 * global.dt;
        
	        if (place_meeting(x, y - 3, objSolid) || placeMeetingMovingPlatform(x, y - 3, prtMovingPlatformSolid))
				&& (ground || place_meeting(x - (slideSpeed * global.dt) + 1, y + 1, objSolid)
					|| place_meeting(x - (slideSpeed * global.dt) + 1, y + 1, objTopSolid)
					|| placeMeetingMovingPlatform(x - (slideSpeed * global.dt) + 1, y + 1, prtMovingPlatformJumpthrough, prtMovingPlatformSolid)
					|| place_meeting(x - (slideSpeed * global.dt) + 1, y, objSolid)
					|| placeMeetingMovingPlatform(x - (slideSpeed * global.dt) + 1, y, prtMovingPlatformSolid)) // Extra check because if Mega Man falls down while sliding and a wall is on the other side of him and a ceiling is on top of him, when turning around on the right frame he would zip through the solids
	        {            
				// Sliding under a ceiling
				if global.keyLeft && !global.keyRight
	            {
	                image_xscale = -1;
	                xspeed = -slideSpeed;
	            }
	            else if global.keyRight && !global.keyLeft
	            {
	                image_xscale = 1;
	                xspeed = slideSpeed;
	            }
                
	            ground = true;  // For the bugfix as explained in the place_meeting checks
	        }
	        else
	        {
				// Sliding normally
	            if !ground || (global.keyLeft && !global.keyRight && image_xscale == 1)
		            || (global.keyRight && !global.keyLeft && image_xscale == -1)
		            || slideTimer >= slideFrames || (global.keyJumpPressed && !global.keyDown)
		            || place_meeting(x + (image_xscale * 3), y, objSolid)
					|| placeMeetingMovingPlatform(x + (image_xscale * 3), y, prtMovingPlatformSolid)
	            {
	                isSlide = false;
	                canMove = true;
	                canSpriteChange = true;
	                mask_index = mskMegaman;
	                slideTimer = 0;
                    
	                // Pushing down until not inside a ceiling anymore
	                while place_meeting(x, y, objSolid) || placeMeetingMovingPlatform(x, y, prtMovingPlatformSolid) // If your slide cancels right under a ceiling, move MM down
	                {
	                    y += 1;
	                    sprite_index = spriteJump;
	                    ground = false;
	                }
                        
	                if !place_meeting(x, y + 1, objIce)
	                    xspeed = 0;
	                else
	                    xspeed = walkSpeed * image_xscale;
                    
	                if global.keyJumpPressed && !global.keyDown
	                {
	                    yspeed = -jumpSpeed;
	                    ground = false;
	                    y -= 1; // To negate the prevGround y += 1
	                }
	            }
	        }
	    }
	    else
	    {
	        slideTimer = 0;
	    }
	}


	// CanSlide (before, if you slid on the exact frame you landed on the ground, you got wall collision and teleported a long distance)
	if !ground
	{
	    canSlide = false;
	    canSlideTimer = 0;
	}
	else
	{
	    if canSlideTimer < 1
	        canSlideTimer += 1 * global.dt;
	    else
	        canSlide = true;
	}


	// Climbing
	var ladder = collision_rectangle(spriteGetXCenter() - 3, bbox_top, spriteGetXCenter() + 3,
		bbox_bottom - 1, objLadder, false, false);
	var ladderDown = collision_rectangle(spriteGetXCenter() - 3, bbox_bottom + 1, spriteGetXCenter() + 3,
		bbox_bottom + 2, objLadder, false, false);
		
	if ((ladder >= 0 && global.keyUp && !global.keyDown)
		|| (ladderDown >= 0 && ground && global.keyDown && !global.keyUp && !place_meeting(x, y, objLadder)))
		&& (canMove || isSlide)
	{
	    isSlide = false;
	    mask_index = mskMegaman;
	    slideTimer = 0;
    
	    climbing = true;
	    canMove = false;
	    canSpriteChange = false;
	    canGravity = false;
    
	    xspeed = 0;
	    yspeed = 0;
    
	    if ladder >= 0
		{
	        x = ladder.x + 8;
		}
	    else if ladderDown >= 0
	    {
	        x = ladderDown.x + 8;
	        y += climbSpeed * global.dt;
	        ground = false;
	    }
    
	    sprite_index = spriteClimb;
	    image_speed = 0;
    
	    ladderXScale = image_xscale;
	    climbShootXscale = ladderXScale;
	}


	// While climbing
	if climbing 
	{
	    isStep = false;
	    canInitStep = false;
    
	    // Movement
	    if global.keyUp && !global.keyDown && !isShoot && !isThrow
	    {
	        climbSpriteTimer += 1 * global.dt;
	        yspeed = -climbSpeed;
	    }
	    else if global.keyDown && !global.keyUp && !isShoot && !isThrow
	    {
	        climbSpriteTimer += 1 * global.dt;
	        yspeed = climbSpeed;
	    }
	    else
	    {
	        yspeed = 0;
	    }
    
	    // Left/right
	    if global.keyRight && !global.keyLeft
	        climbShootXscale = 1;
	    else if global.keyLeft && !global.keyRight
	        climbShootXscale = -1;
    
	    if climbSpriteTimer >= 8 && sprite_index == spriteClimb && !isShoot && !isThrow
	    {
	        climbSpriteTimer -= 8;
	        image_xscale = -image_xscale;
	    }
    
	    // Getup sprite
	    if !position_meeting(x, bbox_top + 11, objLadder) && position_meeting(x, bbox_bottom + 1, objLadder) // The second check is to make sure the getup animation is not shown when on the BOTTOM of a ladder that's placed in the air
	    {
	        sprite_index = spriteGetup;
	        if sprite_index == sprMegamanClimbGetup // Not when shooting
	            image_xscale = 1;
	    }
	    else
	    {
	        sprite_index = spriteClimb;
	    }
    
	    // Releasing the ladder
	    if (ground && !global.keyUp) || !place_meeting(x, y, objLadder) || (global.keyJumpPressed && !global.keyUp)
	    {
	        climbing = false;
	        canMove = true;
	        canSpriteChange = true;
	        canGravity = true;
	        image_xscale = ladderXScale;
	        yspeed = 0;
        
	        if !place_meeting(x, y, objLadder)
	        {
	            var topSolidID = instance_place(x, y + 2, objTopSolid);
	            if topSolidID >= 0
				{
	                y = topSolidID.y - 16;
					ground = true;
				}
                
	            playLandSound = false;
	            playLandSoundTimer = 0;
	        }
			
			if position_meeting(x, bbox_bottom + 15, objTopSolid) || ground
	        {
	            if (global.keyRight && !global.keyLeft) || (global.keyLeft && !global.keyRight)
	            {
	                sprite_index = spriteWalk;
                
	                if global.keyRight
	                {
	                    xspeed = walkSpeed;
	                    image_xscale = 1;
	                }
	                else if global.keyLeft
	                {
	                    xspeed = -walkSpeed;
	                    image_xscale = -1;
	                }
	            }
	            else
				{
	                sprite_index = spriteStand;
				}
	        }
	        else
			{
	            sprite_index = spriteJump;
			}
	    }
	}


	// Water
	if place_meeting(x, y, objWater) && !inWater
	{
	    inWater = true;
	    playSFX(sfxSplash);
    
	    var currentWater = instance_place(x, y, objWater);
	    instanceCreate(x, currentWater.bbox_top + 1, objSplash);
	}

	if inWater 
	{
	    currentGrav = gravWater;
	    currentJumpSpeed = jumpSpeedWater;
    
	    bubbleTimer += 1 * global.dt;
	    if bubbleTimer >= 10
	    {
	        bubbleTimer = 0;
	        if !instance_exists(objAirBubble)
	            instanceCreate(x, y, objAirBubble);
	    }
	}
	else
	{
	    currentGrav = grav;
	    currentJumpSpeed = jumpSpeed;
	    bubbleTimer = 0;
	}


	// Leaving the water
	if inWater 
	{
	    var wtr = instance_place(x, y - (yspeed * global.dt), objWater);
	    if wtr >= 0
	    {
	        if bbox_bottom < wtr.bbox_top
	        {
	            instanceCreate(x, wtr.bbox_top + 1, objSplash);
	            inWater = false;
	            playSFX(sfxSplash);
	        }
	    }
	}
    

	// While being hit
	if isHit 
	{
	    hitTimer += 1 * global.dt;
	    if hitTimer >= hitTime
	    {
	        isHit = false;
	        drawHitspark = false;
	        hitTimer = 0;
        
	        // When sliding and there's a solid above us, we should not experience knockback
	        // If we did, we would clip inside the ceiling above us
	        if !(isSlide && (place_meeting(x, y - 3, objSolid) || placeMeetingMovingPlatform(x, y - 3, prtMovingPlatformSolid)))
	        {
	            canMove = true;
	            canSpriteChange = true;
	        }
        
	        invincibilityTimer = 60;
	    }
	    else
	    {
	        drawHitspark = (hitTimer % 4 < 2); // 2 frames on, 2 frames off
	    }
	}


	// Invincibility
	if invincibilityTimer != 0
	{
	    invincibilityTimer -= 1 * global.dt;
	    if invincibilityTimer <= 0
	    {
	        invincibilityTimer = 0;
	        canHit = true;
	        visible = true;
	    }
	    else
	    {
	        visible = (invincibilityTimer % 2 < 1);
	    }
	}


	// Dying
	if global._health <= 0
	{
	    if !deathByPit
	    {
	        for (var i = 0; i < 360; i += 45)
	        {
	            var explosionID = instanceCreate(x, y, objMegamanExplosion);
	                explosionID.dir = i;
	                explosionID.spd = 1.5;
	        }
        
	        for (var i = 0; i < 360; i += 45)
	        {
	            explosionID = instanceCreate(x, y, objMegamanExplosion);
	                explosionID.dir = i;
	                explosionID.spd = 2.5;
	        }
	    }
    
	    instanceCreate(x, y, objMegamanDeathTimer); // Because the Mega Man object is destoyed upon death, we need to make a different object execute the room restarting code
	    instance_destroy();
    
	    audio_stop_all();
	    playSFX(sfxDeath);
	}


	// Gravity
	if !ground && canGravity 
	{
	    yspeed += currentGrav * global.dt;
	    if yspeed > maxVspeed
	        yspeed = maxVspeed;
	}


	// Variables on the previous frame
	prevGround = ground;
	prevXScale = image_xscale;
}
