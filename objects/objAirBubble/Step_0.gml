if !isFrozen()
{
    image_speed = 0.15 * global.dt;
    vspeed = -1 * global.dt;
    
    if (position_meeting(x, bbox_top - 1 - vspeed, objWater) && !position_meeting(x, bbox_top - 1, objWater))
		|| place_meeting(x, y, objSolid) || placeMeetingMovingPlatform(x, y, prtMovingPlatformSolid)
	{
        instance_destroy();
	}
}
else
{
    image_speed = 0;
    vspeed = 0;
}

