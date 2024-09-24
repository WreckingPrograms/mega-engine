if !isFrozen()
{
    x += xspeed * global.dt;
    image_speed = 0.5 * global.dt;
}
else
{
    image_speed = 0;
}

