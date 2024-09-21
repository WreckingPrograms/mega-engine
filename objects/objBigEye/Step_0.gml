event_inherited();

if !isFrozen() && !dead
{
    checkGround();
    gravityCheckGround();
    generalCollision();
    
    if ground 
    {
        moveTimer += 1;
        if moveTimer == 1
        {
            if repeatAmount < 2
            {
                highJump = choose(true, false); // False means a low jump, true means a high jump
            }
            else
            {
                highJump = !repeatIsHigh;
            }
            
            if !prevGround
                playSFX(sfxBigEye);
            
            image_index = 4;
                
            // To not make the Big Eye spam one jump height by pure randomness
            // Because if he spams low jumps, it's nearly impossible to pass him
            if highJump && repeatIsHigh 
                repeatAmount += 1;
            else if !highJump && !repeatIsHigh
                repeatAmount += 1;
            else
            {
                repeatAmount = 1;
                repeatIsHigh = highJump;
            }
                
            if instance_exists(objMegaman)
            {
                if x > objMegaman.x
                    image_xscale = -1;
                else
                    image_xscale = 1;
            }
            
            xspeed = 0;
            yspeed = 0;
        }
        else if moveTimer == 4
        {
            image_index = 0;
        }
        else if moveTimer == 6
        {
            if highJump 
                image_index = 1;
            else
                image_index = 0;
        }
        else if moveTimer == 40
        {
            if highJump 
            {
                yspeed = -6;
                xspeed = image_xscale * 1;
                image_index = 3;
            }
            else
            {
                yspeed = -3;
                xspeed = image_xscale * 1;
                image_index = 2;
            }
            
            moveTimer = 0;
        }
    }
    
    x += xspeed;
    y += yspeed;
    
    prevGround = ground;
}
else
{
    if dead 
    {
        moveTimer = 0;
        image_index = 2;
        repeatAmount = 0;
        repeatIsHigh = true;
    }
}

