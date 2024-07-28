event_inherited();

if global.frozen == false && dead == false
{
    if moving == false
    {
        moveTimer += 1;
        if moveTimer == 10
        {
            image_index = 0;    //After touching a wall, we want the eye to close slowly (half-open the first 10 frames)
        }
        if moveTimer == 110
        {
            image_index = 1;    //Eye half-open
        }
        else if moveTimer >= 120
        {
            image_index = 2;
            moving = true;
        }
    }
    else
    {
        if dir == "hor"
            xspeed = startDir * 3;
        else
            yspeed = startDir * 3;
            
        generalCollision();
        
        if (xspeed == 0 && dir == "hor") || (yspeed = 0 && dir == "ver")
        {
            moving = false;
            moveTimer = 0;
            image_index = 1; //Eye half-open
            startDir = -startDir;   //Change the direction
        }
        
        x += xspeed;
        y += yspeed;
    }
}
else
{
    if dead == true
    {
        moveTimer = 0;
        startDir = beginStartDir;
        moving = false;
        image_index = 0;
    }
}

