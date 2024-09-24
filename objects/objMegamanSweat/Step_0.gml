if !isFrozen()
{    
    if floor(image_index) == 2
        image_speed = 0;
    else
        image_speed = 3 / 20 * global.dt;
}
else
{
    image_speed = 0;
}

