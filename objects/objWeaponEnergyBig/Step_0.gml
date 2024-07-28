if global.frozen == false
{
    image_speed = 1/6;
    
    if flash == true
    {
        flashTimer += 1;
        if flashTimer >= 2
        {
            visible = !visible;
            flashTimer = 0;
        }
    }
    
    if insideView()
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
        
        y += yspeed;
    }
}
else
{
    image_speed = 0;
    if alarm[0] != -1
        alarm[0] += 1;
    if alarm[1] != -1
        alarm[1] += 1;
}

