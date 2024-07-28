if global.frozen == false
{
    checkGround();
    generalCollision();
    gravityCheckGround();
    
    if xspeed == 0
    {
        instance_destroy();
    }
    
    x += xspeed;
    y += yspeed;
    
    image_speed = 0.5;
}
else
{
    image_speed = 0;
}

