if global.frozen == false
{
    image_speed = 0.375;
    
    xspeed = cos(degtorad(dir)) * 4;
    yspeed = -sin(degtorad(dir)) * 4;   //The vertical speed was, for some reason, inverted, which is why I used a minus. Don't ask me what actually caused this behaviour
    
    x += xspeed;
    y += yspeed;
}
else
{
    image_speed = 0;
}

