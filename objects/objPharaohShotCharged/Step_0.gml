if !isFrozen()
{
    x += xspeed;
    y += yspeed;
    
    image_speed = 1 / 7;
}
else
{
    image_speed = 0;
}

