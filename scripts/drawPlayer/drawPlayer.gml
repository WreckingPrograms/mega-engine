// Draws the player. If using special weapons, whitemasks will be used
function drawPlayer()
{
	// Set the correct whitemasks    
	var primary, secondary, outline;

	switch sprite_index
	{
	    case sprMegamanStand:
	        primary = sprMegamanStandPrimary;
	        secondary = sprMegamanStandSecondary;
	        outline = sprMegamanStandOutline;
	    break;
    
	    case sprMegamanStep:
	        primary = sprMegamanStepPrimary;
	        secondary = sprMegamanStepSecondary;
	        outline = sprMegamanStepOutline;
	    break;
    
	    case sprMegamanWalk:
	        primary = sprMegamanWalkPrimary;
	        secondary = sprMegamanWalkSecondary;
	        outline = sprMegamanWalkOutline;
	    break;
    
	    case sprMegamanJump:
	        primary = sprMegamanJumpPrimary;
	        secondary = sprMegamanJumpSecondary;
	        outline = sprMegamanJumpOutline;
	    break;
    
	    case sprMegamanStandShoot:
	        primary = sprMegamanStandShootPrimary;
	        secondary = sprMegamanStandShootSecondary;
	        outline = sprMegamanStandShootOutline;
	    break;
    
	    case sprMegamanWalkShoot:
	        primary = sprMegamanWalkShootPrimary;
	        secondary = sprMegamanWalkShootSecondary;
	        outline = sprMegamanWalkShootOutline;
	    break;
    
	    case sprMegamanJumpShoot:
	        primary = sprMegamanJumpShootPrimary;
	        secondary = sprMegamanJumpShootSecondary;
	        outline = sprMegamanJumpShootOutline;
	    break;
    
	    case sprMegamanStandThrow:
	        primary = sprMegamanStandThrowPrimary;
	        secondary = sprMegamanStandThrowSecondary;
	        outline = sprMegamanStandThrowOutline;
	    break;
    
	    case sprMegamanWalkThrow:
	        primary = sprMegamanWalkThrowPrimary;
	        secondary = sprMegamanWalkThrowSecondary;
	        outline = sprMegamanWalkThrowOutline;
	    break;
    
	    case sprMegamanJumpThrow:
	        primary = sprMegamanJumpThrowPrimary;
	        secondary = sprMegamanJumpThrowSecondary;
	        outline = sprMegamanJumpThrowOutline;
	    break;
    
	    case sprMegamanSlide:
	        primary = sprMegamanSlidePrimary;
	        secondary = sprMegamanSlideSecondary;
	        outline = sprMegamanSlideOutline;
	    break;
    
	    case sprMegamanClimb:
	        primary = sprMegamanClimbPrimary;
	        secondary = sprMegamanClimbSecondary;
	        outline = sprMegamanClimbOutline;
	    break;
    
	    case sprMegamanClimbShoot:
	        primary = sprMegamanClimbShootPrimary;
	        secondary = sprMegamanClimbShootSecondary;
	        outline = sprMegamanClimbShootOutline;
	    break;
    
	    case sprMegamanClimbThrow:
	        primary = sprMegamanClimbThrowPrimary;
	        secondary = sprMegamanClimbThrowSecondary;
	        outline = sprMegamanClimbThrowOutline;
	    break;
    
	    case sprMegamanClimbGetup:
	        primary = sprMegamanClimbGetupPrimary;
	        secondary = sprMegamanClimbGetupSecondary;
	        outline = sprMegamanClimbGetupOutline;
	    break;
    
	    case sprMegamanHit:
	        primary = sprMegamanHitPrimary;
	        secondary = sprMegamanHitSecondary;
	        outline = sprMegamanHitOutline;
	    break;
    
	    case sprMegamanTeleport:
	        primary = sprMegamanTeleportPrimary;
	        secondary = sprMegamanTeleportSecondary;
	        outline = sprMegamanTeleportOutline;
	    break;
	}

	// If in the middle of the screen, round coordinates, as the view has to be rounded to avoid cut-offs
	var useX = x, useY = y;
	/*if abs(x - (global.viewX + global.viewWidth/2)) <= 2
	    useX = round(x);
	if abs(y - (global.viewY + global.viewHeight/2)) <= 2
	    useY = round(y);*/
    
	draw_sprite_ext(sprite_index, image_index, useX, useY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(primary, image_index, useX, useY, image_xscale, image_yscale, image_angle, global.primaryCol, image_alpha);
	draw_sprite_ext(secondary, image_index, useX, useY, image_xscale, image_yscale, image_angle, global.secondaryCol, image_alpha);
	draw_sprite_ext(outline, image_index, useX, useY, image_xscale, image_yscale, image_angle, global.outlineCol, image_alpha);
}
