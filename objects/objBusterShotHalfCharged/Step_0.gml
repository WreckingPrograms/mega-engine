if !isFrozen()
{
    x += xspeed * global.dt;
    image_speed = 1 / 3 * global.dt;
}
else
{
    image_speed = 0;
}

