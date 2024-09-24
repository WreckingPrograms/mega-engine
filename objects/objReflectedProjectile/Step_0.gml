if canStep 
{
    if !isFrozen()
    {
        image_speed = imgSpd * global.dt;
        speed = 6 * global.dt;
    }
    else
    {
        image_speed = 0;
        speed = 0;
    }
}

