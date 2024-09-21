contactDamage = 2;

var spd = 5;
if instance_exists(objMegaman)
{
    var angle = point_direction(spriteGetXCenter(), spriteGetYCenter(), spriteGetXCenterObject(objMegaman), spriteGetYCenterObject(objMegaman));
    
    xspeed = lengthdir_x(spd, angle);
    yspeed = lengthdir_y(spd, angle);
}
else
{
    xspeed = spd;
    yspeed = 0;
}

