// Handles Mega Man's shooting
function playerShoot()
{
	var box, yy, attackID;
	if image_xscale == 1
	    box = bbox_right + 6;
	else
	    box = bbox_left - 6;
    
	switch sprite_index
	{
	    case spriteJump: yy = y + 3; break;
	    default: yy = y + 4; break;
	}


	// Shooting
	if global.keyShootPressed && canShoot  && (canMove || climbing || isThrow || onRushJet)
		&& instance_number(objBusterShotCharged) < 1 && global.ammo[global.currentWeapon] > 0
	{   
	    if climbing 
	    {
	        image_xscale = climbShootXscale;
        
	        if image_xscale == 1
	            box = bbox_right;
	        else
	            box = bbox_left;
	    }
	
	
		// Fixes a bug where throwing a weapon, then switching weapons and shooting a weapon locks your controls
	    if isThrow 
	    {
	        isThrow = false;
	        if ground 
	        {
	            canMove = true;
	            canSpriteChange = true;
	        }
	    }
            
    
	    playerUseWeapon(global.weapon, yy, box);
	}


	// While shooting
	if isShoot 
	{
	    isThrow = false;
	    shootTimer += 1 * global.dt;
	    if shootTimer >= 20
	    {
	        isShoot = false;
	    }
	}
	else if isThrow // Throwing weapons, like Pharaoh Shot and Metal Blade
	{
	    isShoot = false;
    
	    // To allow shooting in the opposite direction
	    if global.keyShootPressed
	    {
	        if global.keyRight && !global.keyLeft
	            image_xscale = 1;
	        else if global.keyLeft && !global.keyRight
	            image_xscale = -1;
	    }
    
	    if ground && shootTimer <= 0 && !climbing // Only do this on the ground on the first frame
	    {
	        canMove = false;
	        xspeed = 0;
	        canSpriteChange = false;
	        playerHandleSprites(); // We need to call this script because between throwing and checking throwing, it isn't executed and the wrong sprite would display
	        sprite_index = spriteStand;
	        shootTimer = 5; // 20 frames is too much to be frozen for. However, when not frozen, 20 frames looks better
	    }
    
	    if !ground && !climbing
	    {
	        canMove = true;
	        canSpriteChange = true;
	    }
    
	    shootTimer += 1 * global.dt;
	    if shootTimer >= 20
	    {
	        isThrow = false;
	        if ground 
	        {
	            canMove = true;
	            canSpriteChange = true;
	        }
	    }
	}


	// Charging
	if global.enableCharge 
	{
	    if global.weapon == Weapons.MEGA_BUSTER && (global.keyShoot || (isSlide && chargeTimer > 0))
	    {
	        if (canMove || isSlide || climbing) && !isShoot
	        {
	            isCharge = true;
            
	            if !isSlide
	                initChargeTimer += 1 * global.dt;
                
	            if initChargeTimer >= initChargeTime
	            {
					if chargeTimer == 0
	                    playSFX(sfxCharging);
				
	                chargeTimer += 1 * global.dt;
                
	                if chargeTimer < chargeTime
	                {
	                    var chargeCol;
	                    var chargeTimeDiv = round(chargeTime / 3);
	                    if chargeTimer < chargeTimeDiv
	                        chargeCol = make_color_rgb(168, 0, 32);     // Dark red
	                    else if chargeTimer < chargeTimeDiv * 2
	                        chargeCol = make_color_rgb(228, 0, 88);     // Red (dark pink)
	                    else
	                        chargeCol = make_color_rgb(248, 88, 152);   // Light red (pink)
                        
	                    if chargeTimer % 4 < 2
	                        global.outlineCol = chargeCol;
	                    else
	                        global.outlineCol = c_black;
	                }
	                else
	                {
	                    if audio_is_playing(sfxCharging)
	                    {
	                        audio_stop_sound(sfxCharging);
	                        playSFX(sfxCharged);
	                    }
                    
						// This used to be chargeTimer / 2, but I slowed it down slightly for accessibility
						// I recommend including some kind of option in your game to disable charge flashes
						// altogether, though!
	                    switch floor((chargeTimer / 3) % 3)
	                    {
	                        case 0: // Light blue helmet, black shirt, blue outline
	                            global.primaryCol = make_color_rgb(0, 232, 216);
	                            global.secondaryCol = c_black;
	                            global.outlineCol = make_color_rgb(0, 120, 248);
	                        break;
                        
	                        case 1: // Black helmet, blue shirt, light blue outline
	                            global.primaryCol = c_black;
	                            global.secondaryCol = make_color_rgb(0, 120, 248);
	                            global.outlineCol = make_color_rgb(0, 232, 216);
	                        break;
                        
	                        case 2: // Blue helmet, light blue shirt, blue outline
	                            global.primaryCol = make_color_rgb(0, 120, 248);
	                            global.secondaryCol = make_color_rgb(0, 232, 216);
	                            global.outlineCol = c_black;
	                        break;
	                    }
	                }
	            }
	        }
	    }
	    else if global.weapon == Weapons.MEGA_BUSTER && !global.keyShoot // Release the charge shot
	    {
	        if (canMove || climbing) && chargeTimer != 0
	        {
	            isShoot = true;
	            shootTimer = 0;
            
	            if climbing 
	            {
	                image_xscale = climbShootXscale;
                
	                if image_xscale == 1
	                    box = bbox_right;
	                else
	                    box = bbox_left;
	            }
        
	            if chargeTimer < chargeTime
	            {
	                attackID = instanceCreate(box + (image_xscale * 6), yy, objBusterShotHalfCharged);
	                    attackID.xspeed = image_xscale * 5;
	                    attackID.image_xscale = image_xscale;
	                playSFX(sfxBusterHalfCharged);
	            }
	            else
	            {
	                attackID = instanceCreate(box + (image_xscale * 14), yy, objBusterShotCharged);
	                    attackID.xspeed = image_xscale * 5.5;
	                    attackID.image_xscale = image_xscale;
	                playSFX(sfxBusterCharged);
	            }
            
	            chargeTimer = 0;
	            initChargeTimer = 0;
	            audio_stop_sound(sfxCharged);
	            audio_stop_sound(sfxCharging);
	            event_user(0); // Reset the colors
	        } 
	    }
	}


	// Charging the Pharaoh Shot
	if global.weapon == Weapons.PHARAOH_SHOT && global.ammo[global.currentWeapon] > 0
	{
	    if global.keyShoot && !instance_exists(objPharaohShotCharging)
	    {
	        pharaohShotInitTimer += 1 * global.dt;
	        if pharaohShotInitTimer >= 30
	        {
	            instanceCreate(x + image_xscale, y - 20, objPharaohShotCharging);
	            pharaohShotInitTimer = 0;
	        }
	    }
	    else if !global.keyShoot && instance_exists(objPharaohShotCharging)
	    {
	        if (canMove || climbing)
	        {
	            if climbing 
	            {
	                image_xscale = climbShootXscale;
	            }
            
	            if objPharaohShotCharging.sprite_index == sprPharaohShotCharging // Small shot
	            {
	                attackID = instanceCreate(box + (image_xscale * 4), yy, objPharaohShot);
	                    attackID.xspeed = image_xscale * 4.5;
                    
	                if global.keyUp && !global.keyDown
	                    attackID.yspeed = -4.5;
	                else if global.keyDown && !global.keyUp
	                    attackID.yspeed = 4.5;
	                else
	                    attackID.yspeed = 0;
                    
	                playSFX(sfxPharaohShot);
	                isThrow = true;
	                shootTimer = 0;
                
	                playerConsumeAmmo(global.currentWeapon);
	            }
	            else  // Big shot
	            {
	                attackID = instanceCreate(box + (image_xscale * 10), yy, objPharaohShotCharged);
	                    attackID.xspeed = image_xscale * 4.5;
                    
	                if global.keyUp && !global.keyDown
	                    attackID.yspeed = -4.5;
	                else if global.keyDown && !global.keyUp
	                    attackID.yspeed = 4.5;
	                else
	                    attackID.yspeed = 0;
                    
	                playSFX(sfxPharaohShotCharged);
	                isThrow = true;
	                shootTimer = 0;
                
					playerConsumeAmmo(global.currentWeapon, 2);
	            }
            
	            with objPharaohShotCharging instance_destroy();
	        }
	    }
	    else
	    {
	        pharaohShotInitTimer = 0;
	    }
	}
	else
	{
	    pharaohShotInitTimer = 0;
	}
}
