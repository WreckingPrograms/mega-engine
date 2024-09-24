if !isFrozen()
{
    checkGround();
    generalCollision();
    gravityCheckGround();
    
    if xspeed == 0
    {
        instance_destroy();
    }
    
    x += xspeed * global.dt;
    y += yspeed * global.dt;
    
    image_speed = 0.5 * global.dt;
}
else
{
    image_speed = 0;
}

