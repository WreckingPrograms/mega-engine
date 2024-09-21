if !isFrozen()
{
    xspeed = lengthdir_x(3, dir) * xscale;
    yspeed = lengthdir_y(3, dir);
    
    x += xspeed;
    y += yspeed;
}

