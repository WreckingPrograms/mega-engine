if !isFrozen()
{
    yspeed -= 0.25 * global.dt;
    x += xspeed * global.dt;
    y += yspeed * global.dt;
    image_speed = 0.6 * global.dt;
}
else
{
    image_speed = 0;
}

