contactDamage = 2;

var spd;
spd = 5;
if instance_exists(objMegaman)
{
    var angle;
    angle = point_direction(spriteGetXCenter(), spriteGetYCenter(), spriteGetXCenterObject(objMegaman), spriteGetYCenterObject(objMegaman));
    
    xspeed = cos(degtorad(angle)) * spd;
    yspeed = -sin(degtorad(angle)) * spd;
}
else
{
    xspeed = spd;
    yspeed = 0;
}

