if global.frozen == false
{
    xspeed = cos(degtorad(dir)) * 3 * xscale;
    yspeed = -sin(degtorad(dir)) * 3;   //The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
    
    x += xspeed;
    y += yspeed;
}

