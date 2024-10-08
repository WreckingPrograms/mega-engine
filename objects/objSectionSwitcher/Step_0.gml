// Moving the screen and player (or rather, both the player and the clone of the player. See create event for more information on that)

if canStep && playerSpeedHorDoor != 0 // When the door is closing, we should not move
{
    if !(door && !canProgressDoor)
    {
        // Right
        if dir == Directions.RIGHT
        {
            global.viewX += screenSpeedHor * global.dt;
            
            if !door
            {
                x += playerSpeedHor * global.dt;
                objMegaman.x += playerSpeedHor * global.dt;
            }
            else
            {
                x += playerSpeedHorDoor * global.dt;
                objMegaman.x += playerSpeedHorDoor * global.dt;
            }
            
            if global.viewX >= objMegaman.sectionLeft
            {
                global.viewX = objMegaman.sectionLeft;
                
                if !door
                {
                    global.frozen = false;
                    objMegaman.visible = true;
                    instance_destroy();
                    with objMegaman playerDeactivateObjects();
                }
                else
                {
                    var bossdr = instance_place(objMegaman.sectionLeft, y, objBossDoor);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        imgSpd = 0;
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
        
        // Left
        else if dir == Directions.LEFT
        {
            global.viewX -= screenSpeedHor * global.dt;
            
            if !door
            {
                x -= playerSpeedHor * global.dt;
                objMegaman.x -= playerSpeedHor * global.dt;
            }
            else
            {
                x -= playerSpeedHorDoor * global.dt;
                objMegaman.x -= playerSpeedHorDoor * global.dt;
            }
            
            if global.viewX <= objMegaman.sectionRight - global.viewWidth
            {
                global.viewX = objMegaman.sectionRight - global.viewWidth;
                
                if !door
                {
                    global.frozen = false;
                    objMegaman.visible = true;
                    instance_destroy();
                    with objMegaman playerDeactivateObjects();
                }
                else
                {
                    var bossdr = instance_place(objMegaman.sectionRight, y, objBossDoor);
                    if bossdr >= 0
                    {
                        bossdr.opening = false;
                        bossdr.closing = true;
                        imgSpd = 0;
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
        
        // Down
        else if dir == Directions.DOWN
        {
            global.viewY += screenSpeedVert * global.dt;
            y += playerSpeedVert * global.dt;
            objMegaman.y += playerSpeedVert * global.dt;
            
            if global.viewY >= objMegaman.sectionTop
            {
                global.viewY = objMegaman.sectionTop;
                global.frozen = false;
                objMegaman.visible = true;
                instance_destroy();
                with objMegaman playerDeactivateObjects();
                instance_activate_object(prtEnemy); // To not make it invisible for 1 frame after re-entering the section
            }
        }
        
        // Up
        else if dir == Directions.UP
        {
            global.viewY -= screenSpeedVert * global.dt;
            y -= playerSpeedVert * global.dt;
            objMegaman.y -= playerSpeedVert * global.dt;
            
            if global.viewY <= objMegaman.sectionBottom - global.viewHeight
            {
                global.viewY = objMegaman.sectionBottom - global.viewHeight;
                global.frozen = false;
                objMegaman.visible = true;
                instance_destroy();
                with objMegaman playerDeactivateObjects();
            }
        }
        
        
        
        // Climbing animation
        if sprite_index == sprMegamanClimb
        {
            climbTimer += 1 * global.dt;
            if climbTimer >= 8
            {
                image_xscale = -image_xscale;
                with objMegaman image_xscale = -image_xscale;
                climbTimer -= 8;
            }
        }
    }
	
	if canAnimate
		image_speed = imgSpd * global.dt;
}


// Quick weapon switching
with objMegaman playerSwitchWeapons();

