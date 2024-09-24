if !isFrozen()
{
    image_speed = 0.375 * global.dt;
    
    xspeed = lengthdir_x(4, dir);
    yspeed = lengthdir_y(4, dir);
    
    x += xspeed * global.dt;
    y += yspeed * global.dt;
}
else
{
    image_speed = 0;
}

