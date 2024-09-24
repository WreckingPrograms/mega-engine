if !isFrozen()
{
    image_speed = 0.35;
    
    // The init state, where the Star Crash grows until the normal size is reached
    // The mask is still the same as the normal size, however, to make things more fair
    // The sprite during this state is sprStarCrashInit
    endInitTimer += 1 * global.dt;
    if sprite_index != sprStarCrash && endInitTimer >= floor((1 / image_speed) * sprite_get_number(sprStarCrashInit))
    {
        sprite_index = sprStarCrash;
        image_index = 0;
    }
	
	image_speed *= global.dt;
    
    // Sticking to the player until fired or destroyed in any way
    if followPlayer 
    {
        if instance_exists(objMegaman)
        {
            x = spriteGetXCenterObject(objMegaman);
            y = spriteGetYCenterObject(objMegaman);
        }
        else
        {
            instance_destroy();
        }
        
        if global.keyShootPressed && endInitTimer >= 8 // Do not shoot the weapon until the init state is over
        {
            var dir; // 1 = firing to the right, -1 = firing to the left
            if instance_exists(objMegaman)
                dir = objMegaman.image_xscale;
            else
                dir = 1;
                
            followPlayer = false;
            xspeed = dir * spd;
            
			playerConsumeAmmo(global.currentWeapon);
        }
    }
    
    x += xspeed * global.dt;
    y += yspeed * global.dt;
}
else
{
    image_speed = 0;
}

