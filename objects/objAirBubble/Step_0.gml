if global.frozen == false
{
    image_speed = 0.15;
    vspeed = -1;
    
    if position_meeting(x, bbox_top-1-vspeed, objWater) && !position_meeting(x, bbox_top-1, objWater)
    || place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)
        instance_destroy();
}
else
{
    image_speed = 0;
    vspeed = 0;
}

