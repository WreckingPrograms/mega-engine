// / @function playerGetHit
// / @param health
// / @description Makes the player get hit
// /				 Call it like this: with objMegaman playerGetHit();
function playerGetHit(argument0) {


	if canHit 
	{
	    global._health -= argument0;
    
	    canHit = false;
	    isHit = true;
	    hitTimer = 0;
	    isStep = false;
	    climbing = false;
	    canGravity = true;
	    isShoot = false;
	    isThrow = false;
	    onRushJet = false;
    
	    // When sliding and there's a solid above us, we should not experience knockback
	    // If we did, we would clip inside the ceiling above us
	    if !(isSlide  && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid)))
	    {
	        canMove = false;
	        canSpriteChange = false;
	        isSlide = false;
	        mask_index = mskMegaman;
	        xspeed = image_xscale * -0.5;
	        yspeed = 0;
        
	        if global._health > 0
	        {
	            sprite_index = spriteHit;
            
	            // Create sweat effects
	            instanceCreate(spriteGetXCenter()-11, spriteGetYCenter()-17, objMegamanSweat);
	            instanceCreate(spriteGetXCenter(), spriteGetYCenter()-17, objMegamanSweat);
	            instanceCreate(spriteGetXCenter()+11, spriteGetYCenter()-17, objMegamanSweat);
	        }
	    }
    
	    if global._health > 0
	        playSFX(sfxHit);
	}


}
