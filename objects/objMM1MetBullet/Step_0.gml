if !isFrozen()
{
    xspeed = lengthdir_x(1.5, dir) * xscale;
    yspeed = lengthdir_y(1.5, dir);
    
    x += xspeed;
    y += yspeed;
}

