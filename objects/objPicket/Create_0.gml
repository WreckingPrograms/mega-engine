contactDamage = 2;
image_speed = 1/6;

yspeed = -6;

if instance_exists(objMegaman)
{
    dx = abs(x - objMegaman.x);
    dy = objMegaman.y - y;
    
    if dy > -9 || dy < -18
    {
        switch (round(dy / 16) * 16)
        {
            case 0: const = 20; break;
            case 16: const = 10; break;
            case 32: const = 7; break;
            case 48: const = 5.5; break;
            case 64: const = 4; break;
            case 80: const = 3.7; break;
            case 96: const = 3.5; break;
            case 112: const = 3.3; break;
            case 128: const = 3; break;
            
            case -16: const = -120; break;
            case -32: const = -13; break;
            case -48: const = -7; break;
            case -64: const = -5; break;
            
            default: const = 20; break;
        }
    }
    else
    {
        if dy == -18 || dy == -17
            const = 250;
        else if dy == -16 || dy == -15
            const = 120;
        else if dy == -14 || dy == -13
            const = 60;
        else if dy == -12 || dy == -11
            const = 40;
        else
            const = 30;
    }
    
    
    var ddy;
    if dy == -18
        ddy = -17;  //To avoid dividing by 0
    else
        ddy = dy;
    
    xspeed = dx / ( (3 + (ddy / 6)) * const );
}
else
{
    alarm[7] = 1;
}

