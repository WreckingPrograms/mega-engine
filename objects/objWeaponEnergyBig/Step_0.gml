if !isFrozen()
{
    image_speed = 1 / 6 * global.dt;
    
    if flash 
    {
        flashTimer += 1 * global.dt;
        if flashTimer >= 2
        {
            visible = !visible;
            flashTimer -= 2;
        }
    }
	else if timeBeforeDestroy > 0
	{
		destroyTimer += 1 * global.dt;
		if destroyTimer >= timeBeforeDestroy
		{
			flash = true;
			delay(60, function() { instance_destroy(); });
		}
	}
    
    if insideView()
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
        
        y += yspeed * global.dt;
    }
}
else
{
    image_speed = 0;
}

