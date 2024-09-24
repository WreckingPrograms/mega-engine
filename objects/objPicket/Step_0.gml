if !isFrozen()
{
    gravityNoGround();
    
    x += xspeed * global.dt;
    y += yspeed * global.dt;
    
    image_speed = 1 / 6 * global.dt;
}
else
{
    image_speed = 0;
}

