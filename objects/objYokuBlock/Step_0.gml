event_inherited();

if global.frozen == false && dead == false
{
    switch phase
    {
        case 0: //Waiting to appear
            //Timer
            timer += 1;
            if timer >= startup
            {
                timer = 0;
                phase = 1;
                
                image_index = 0;
                
                while place_meeting(x, y, objMegaman)
                {
                    with objMegaman y -= 1; //If the Yoku Block spawns "inside" Mega Man, push Mega Man upwards'. This way, it's much more fair
                    with objMegaman ground = true;
                }
                
                if insideView()
                {
                    playSFX(sfxYokuBlock);
                    visible = true;
                    mySolid = instance_create(x, y, objSolid);
                }
            }
        break;
        
        case 1: //Active
            //Animation
            if image_index < image_number-1
                image_speed = 0.25;
            else
            {
                image_speed = 0;
                image_index = image_number-1;
            }
            
            //Timer
            timer += 1;
            if timer >= active
            {
                timer = 0;
                phase = 2;
                visible = false;
                image_index = 0;
                
                if instance_exists(mySolid)
                    with mySolid instance_destroy();
            }
        break;
        
        case 2: //Waiting to reappear after disappearing
            //Timer
            timer += 1;
            if timer >= wait
            {
                timer = 0;
                phase = 1;
                    
                image_index = 0;
                
                while place_meeting(x, y, objMegaman)
                {
                    with objMegaman y -= 1; //If the Yoku Block spawns "inside" Mega Man, push Mega Man upwards'. This way, it's much more fair
                    with objMegaman ground = true;
                }
                
                if insideView()
                {
                    playSFX(sfxYokuBlock);
                    visible = true;
                    mySolid = instance_create(x, y, objSolid);
                }
            }
        break;
    }
}
else
{
    image_speed = 0;
}

