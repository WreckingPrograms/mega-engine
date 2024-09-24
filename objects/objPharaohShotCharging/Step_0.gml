if !isFrozen()
{
    imgIndex += imgSpeed * global.dt;
    
    // After fully charging, change sprites
    if sprite_index == sprPharaohShotCharging
    {
        if imgIndex >= image_number - (imgSpeed * 3)
        {
            sprite_index = sprPharaohShotCharged;
            imgIndex = 1;
        }
    }
    
    image_index = imgIndex;
}

