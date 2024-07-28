if global.frozen == false
{
    yspeed -= 0.25;
    x += xspeed;
    y += yspeed;
    image_speed = 0.6;
}
else
{
    image_speed = 0;
}

