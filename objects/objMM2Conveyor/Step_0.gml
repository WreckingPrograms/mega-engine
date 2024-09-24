event_inherited();

if !isFrozen() && !dead
{
    xspeed = dir * spd;
    
    x -= xspeed * global.dt;
}

