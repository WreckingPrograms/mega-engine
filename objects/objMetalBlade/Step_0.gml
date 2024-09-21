if !isFrozen()
{
    image_speed = 0.375;
    
    xspeed = lengthdir_x(4, dir);
    yspeed = lengthdir_y(4, dir);
    
    x += xspeed;
    y += yspeed;
}
else
{
    image_speed = 0;
}

