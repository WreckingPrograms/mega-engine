// Fire the specified weapon
function playerUseWeapon(weapon, yy=undefined, box=undefined)
{
	if is_undefined(yy)
	{
		switch sprite_index
		{
		    case spriteJump: yy = y + 3; break;
		    default: yy = y + 4; break;
		}
	}
	
	if is_undefined(box)
	{
		if climbing 
	    {
			if image_xscale == 1
	            box = bbox_right;
	        else
	            box = bbox_left;
	    }
		else
		{		
			if image_xscale == 1
			    box = bbox_right + 6;
			else
			    box = bbox_left - 6;
		}
	}
	
	if climbing 
	{
	    image_xscale = climbShootXscale;
	}

	switch weapon
	{
	    case Weapons.MEGA_BUSTER:
	        if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) < 3
	        {
	            attackID = instanceCreate(box + (image_xscale * 4), yy, objBusterShot);
	                attackID.xspeed = image_xscale * 5;
	            playSFX(sfxBuster);
	            isShoot = true;
	            shootTimer = 0;
	        }
	    break;
        
	    case Weapons.SILVER_TOMAHAWK:
	        if instance_number(objSilverTomahawk) < 2
	        {
	            attackID = instanceCreate(box + (image_xscale * 12), yy, objSilverTomahawk);
	                attackID.xspeed = image_xscale * 3.5;
	            playSFX(sfxBuster);
	            isShoot = true;
	            shootTimer = 0;
                
	            playerConsumeAmmo(global.currentWeapon);
	        }
	    break;
        
	    case Weapons.WIND_STORM:
	        if instance_number(objWindStorm) < 3
	        {
	            attackID = instanceCreate(box + (image_xscale * 9), yy, objWindStorm);
	                attackID.xspeed = image_xscale * 3;
	                attackID.image_xscale = image_xscale;
	            playSFX(sfxBuster);
	            isShoot = true;
	            shootTimer = 0;
                
	            playerConsumeAmmo(global.currentWeapon);
	        }
	    break;
        
	    case Weapons.PHARAOH_SHOT:
	        if instance_number(objPharaohShot) < 3
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
	    break;
        
	    case Weapons.METAL_BLADE:
	        if instance_number(objMetalBlade) < 3
	        {
	            attackID = instanceCreate(x + (image_xscale * 3), yy, objMetalBlade);
                    
	            if global.keyRight && !global.keyLeft && global.keyUp
	                attackID.dir = 45;
	            else if global.keyLeft && !global.keyRight && global.keyUp
	                attackID.dir = 135;
	            else if global.keyLeft && !global.keyRight && global.keyDown
	                attackID.dir = 225;
	            else if global.keyRight && !global.keyLeft && global.keyDown
	                attackID.dir = 315;
	            else if global.keyUp
	                attackID.dir = 90;
	            else if global.keyDown
	                attackID.dir = 270;
	            else
	            {
	                if image_xscale == -1
	                    attackID.dir = 180;
	                else
	                    attackID.dir = 0;
	            }
                    
	            playSFX(sfxMetalBlade);
	            isThrow = true;
	            shootTimer = 0;
                
	            playerConsumeAmmo(global.currentWeapon);
	        }
	    break;
        
	    case Weapons.STAR_CRASH:
	        if instance_number(objStarCrash) < 1
	        {
	            attackID = instanceCreate(x, spriteGetYCenter(), objStarCrash);
	        }
	    break;
        
	    case Weapons.RUSH_COIL:
	        if instance_number(objRushCoil) < 1
	        {
				var topAllowedY = ground ? spriteGetYCenter() : spriteGetYCenter() + 20;
				var bottomAllowedY = topAllowedY + 256; // Effectively no downward limit anymore
				var spawnX = x + (image_xscale * 26);
				
				var solidsList = ds_list_create();
				collisionRectangleListMovingPlatform(spawnX - 1, topAllowedY, spawnX + 1, bottomAllowedY,
					solidsList, objSolid, objTopSolid, prtMovingPlatformSolid, prtMovingPlatformJumpthrough);
				var solidsArray = dsListToArray(solidsList); // So that it can be sorted with a custom function
				ds_list_destroy(solidsList);
				array_sort(solidsArray, function(el1, el2) { return el1.bbox_top - el2.bbox_top }); // Sort solids from top to bottom
				
				var spawnY = undefined;
				var rushLeftOffset = -sprite_get_xoffset(sprRushCoil) + sprite_get_bbox_left(sprRushCoil);
				var rushRightOffset = -sprite_get_xoffset(sprRushCoil) + sprite_get_bbox_right(sprRushCoil);
				var rushTopOffset = -(sprite_get_bbox_bottom(sprRushCoil) - sprite_get_bbox_top(sprRushCoil));
				var rushBottomOffset = -1;
				for (var i = 0, len = array_length(solidsArray); i < len; i++)
				{
					// Use the first solid that Rush can spawn on safely
					var _solid = solidsArray[i];
					var solidTop = _solid.bbox_top;
					if !collisionRectangleMulti(spawnX + rushLeftOffset, solidTop + rushTopOffset,
						spawnX + rushRightOffset, solidTop + rushBottomOffset,
						objSolid, prtMovingPlatformSolid)
					{
						spawnY = solidTop - 16;
						break;
					}
				}
				
				if is_undefined(spawnY)
				{
					// Could not find a safe spot for Rush
					attackID = instanceCreate(spawnX, spriteGetYCenter(), objRushCoil);
	                    attackID.shouldLand = false;
	                    attackID.image_xscale = image_xscale;
				}
				else
				{
					attackID = instanceCreate(spawnX, spawnY, objRushCoil);
	                    attackID.shouldLand = true;
	                    attackID.image_xscale = image_xscale;
				}
	        }
	        else
	        {
	            if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) < 3
	            {
	                attackID = instanceCreate(box + (image_xscale * 4), yy, objBusterShot);
	                    attackID.xspeed = image_xscale * 5;
	                playSFX(sfxBuster);
	                isShoot = true;
	                shootTimer = 0;
	            }
	        }
	    break;
        
	    case Weapons.RUSH_JET:
	        if instance_number(objRushJet) < 1
	        {
	            attackID = instanceCreate(x + (image_xscale * 26), spriteGetYCenter() - 8, objRushJet);
					attackID.image_xscale = image_xscale;
	        }
	        else
	        {
	            if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) < 3
	            {
	                attackID = instanceCreate(box + (image_xscale * 4), yy, objBusterShot);
	                    attackID.xspeed = image_xscale * 5;
	                playSFX(sfxBuster);
	                isShoot = true;
	                shootTimer = 0;
	            }
	        }
	    break;
	}
}