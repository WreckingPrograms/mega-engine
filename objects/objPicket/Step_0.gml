if global.frozen == false
{
    gravityNoGround();
    
    var ddy;
    if dy == -18
        ddy = -17;  //To avoid dividing by 0
    else
        ddy = dy;
    
    xspeed = dx / ( (3 + (ddy / 6)) * const );
    
    x += xspeed * image_xscale;
    y += yspeed;
    
    image_speed = 1/6;
}
else
{
    image_speed = 0;
}

