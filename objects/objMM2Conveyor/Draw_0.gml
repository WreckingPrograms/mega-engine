if size >= 3
{
    var i;
    for(i = 0; i < size; i += 1)
    {
        if i == 0
            draw_sprite(sprMM2Conveyor, arrowImg, round(x), round(y));
        else if i == size-1
            draw_sprite(sprMM2Conveyor, arrowImg, round(x)+i*16, round(y));
        else
            draw_sprite(sprMM2Conveyor, midImg, round(x)+i*16, round(y));
    }
    
    if global.frozen == false
    {
        // Animation //
        
        //Arrows
        arrowTimer += 1;
        if arrowTimer >= 13
        {
            arrowTimer = 0;
            if arrowImg == 4
            {
                if dir == 1
                    arrowImg = 3;
                else
                    arrowImg = 2;
            }
            else
                arrowImg = 4;
        }
        
        //Middle
        midTimer += 1;
        if midTimer >= 5
        {
            midTimer = 0;
            if midImg == 0
                midImg = 1;
            else
                midImg = 0;
        }
    }
    else
    {
        if instance_exists(objSectionSwitcher)
        {
            arrowImg = 4;
            midImg = 0;
        }
    }
}
else
{
    var i;
    for(i = 0; i < size; i += 1)
    {
        draw_sprite(sprMM2Conveyor, midImg, round(x)+i*16, round(y));
    }
    
    if global.frozen == false
    {
        // Animation //
        
        //Middle
        midTimer += 1;
        if midTimer >= 5
        {
            midTimer = 0;
            if midImg == 0
                midImg = 1;
            else
                midImg = 0;
        }
    }
}

