//Moving the screen and player (or rather, both the player and the clone of the player. See create event for more information on that)

if canStep == true && playerSpeedHorDoor != 0 //When the door is closing, we should not move
{
    if !(door == true && canProgressDoor == false)
    {
        //Right
        if dir == "right"
        {
            global.viewX += screenSpeedHor;
            
            if door == false
            {
                x += playerSpeedHor;
                objMegaman.x += playerSpeedHor;
            }
            else
            {
                x += playerSpeedHorDoor;
                objMegaman.x += playerSpeedHorDoor;
            }
            
            if global.viewX >= objMegaman.sectionLeft
            {
                global.viewX = objMegaman.sectionLeft;
                
                if door == false
                {
                    global.frozen = false;
                    objMegaman.visible = true;
                    instance_destroy();
                    with objMegaman playerDeactivateObjects();
                }
                else
                {
                    var bossdr;
                    bossdr = instance_place(objMegaman.sectionLeft, y, objBossDoor);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        image_speed = 0;
                        playSFX(sfxDoor);
                        
                        playerSpeedHorDoor = 0;
                    }
                    else
                    {
                        global.frozen = false;
                        objMegaman.visible = true;
                        instance_destroy();
                        with objMegaman playerDeactivateObjects();
                    }
                }
            }
        }
        
        //Left
        else if dir == "left"
        {
            global.viewX -= screenSpeedHor;
            
            if door == false
            {
                x -= playerSpeedHor;
                objMegaman.x -= playerSpeedHor;
            }
            else
            {
                x -= playerSpeedHorDoor;
                objMegaman.x -= playerSpeedHorDoor;
            }
            
            if global.viewX <= objMegaman.sectionRight-global.viewWidth
            {
                global.viewX = objMegaman.sectionRight-global.viewWidth;
                
                if door == false
                {
                    global.frozen = false;
                    objMegaman.visible = true;
                    instance_destroy();
                    with objMegaman playerDeactivateObjects();
                }
                else
                {
                    var bossdr;
                    bossdr = instance_place(objMegaman.sectionRight, y, objBossDoor);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        image_speed = 0;
                        playSFX(sfxDoor);
                        
                        playerSpeedHorDoor = 0;
                    }
                    else
                    {
                        global.frozen = false;
                        objMegaman.visible = true;
                        instance_destroy();
                        with objMegaman playerDeactivateObjects();
                    }
                }
            }
        }
        
        //Down
        else if dir == "down"
        {
            global.viewY += screenSpeedVert;
            y += playerSpeedVert;
            objMegaman.y += playerSpeedVert;
            
            if global.viewY >= objMegaman.sectionTop
            {
                global.viewY = objMegaman.sectionTop;
                global.frozen = false;
                objMegaman.visible = true;
                instance_destroy();
                with objMegaman playerDeactivateObjects();
                instance_activate_object(prtEnemy); //To not make it invisible for 1 frame after re-entering the section
            }
        }
        
        //Up
        else if dir == "up"
        {
            global.viewY -= screenSpeedVert;
            y -= playerSpeedVert;
            objMegaman.y -= playerSpeedVert;
            
            if global.viewY <= objMegaman.sectionBottom - global.viewHeight
            {
                global.viewY = objMegaman.sectionBottom - global.viewHeight;
                global.frozen = false;
                objMegaman.visible = true;
                instance_destroy();
                with objMegaman playerDeactivateObjects();
            }
        }
        
        
        
        //Climbing animation
        if sprite_index == sprMegamanClimb
        {
            climbTimer += 1;
            if climbTimer >= 8
            {
                image_xscale = -image_xscale;
                with objMegaman image_xscale = -image_xscale;
                climbTimer = 0;
            }
        }
    }
}


//Quick weapon switching
with objMegaman playerSwitchWeapons();

