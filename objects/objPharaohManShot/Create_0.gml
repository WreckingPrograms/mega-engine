contactDamage = 2;

var spd;
spd = 5;
if instance_exists(objMegaman)
{
    var angle;
    angle = point_direction(sprite_get_xcenter(), sprite_get_ycenter(), sprite_get_xcenter_object(objMegaman), sprite_get_ycenter_object(objMegaman));
    
    xspeed = cos(degtorad(angle)) * spd;
    yspeed = -sin(degtorad(angle)) * spd;
}
else
{
    xspeed = spd;
    yspeed = 0;
}

