if !isFrozen()
{
    y += yspeed * global.dt;
    image_speed = imgSpeed * global.dt;
}
else
{
    image_speed = 0;
}

