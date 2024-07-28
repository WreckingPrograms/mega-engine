if global.frozen == false
{    
    if floor(image_index) == 2
        image_speed = 0;
    else
        image_speed = 3 / 20;
}
else
{
    image_speed = 0;
    alarm[0] += 1;
}

