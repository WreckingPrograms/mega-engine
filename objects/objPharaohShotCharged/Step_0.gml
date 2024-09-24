if !isFrozen()
{
    x += xspeed * global.dt;
    y += yspeed * global.dt;
    
    image_speed = 1 / 7 * global.dt;
}
else
{
    image_speed = 0;
}

