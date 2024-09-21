if !isFrozen()
{
    gravityNoGround();
    
    x += xspeed;
    y += yspeed;
    
    image_speed = 1 / 6;
}
else
{
    image_speed = 0;
}

