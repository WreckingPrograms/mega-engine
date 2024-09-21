if canOpen 
{
    if instance_exists(objMegaman)
    {
        // Colliding with the player. We're checking x+7 because in the NES games, the player needs to be slightly inside the door
        // for it to activate.
        if (collision_rectangle(x + 6, y, x + 7, y + sprite_height, objMegaman, false, false) >= 0 && dir == -1)
        || (collision_rectangle(x + sprite_width - 7, y, x + sprite_width - 6, y + sprite_height, objMegaman, false, false) >= 0 && dir == 1)
        {
            canOpen = false;
            opening = true;
            image_speed = openImgSpeed;
            playSFX(sfxDoor);
            with mySolid instance_destroy();
			
			instance_activate_object(objSectionBorderLeft);
            instance_activate_object(objSectionBorderRight);
            instance_activate_object(objSectionBorderTop);
            instance_activate_object(objSectionBorderBottom);
            instance_activate_object(objSectionArrowLeft);
            instance_activate_object(objSectionArrowRight);
            instance_activate_object(objSectionArrowUp);
            instance_activate_object(objSectionArrowDown);
			
			var xOffset = -64 * dir;
			with objMegaman
			{
				newSectionXOffset = xOffset;
                newSectionYOffset = 0;
				alarm[2] = 1;
			}
        }
    }
}


if opening 
{
    if floor(image_index) == 4
    {
        image_index = 4;
        image_speed = 0;
    }
}

if closing 
{
    image_speed = openImgSpeed;
    if floor(image_index) == 8
    {
        image_index = 8;
        
        if dir == -1
        {
            mySolid = instanceCreate(x + 16, y, objSolid);
                mySolid.image_yscale = 4;
        }
        else
        {
            mySolid = instanceCreate(x, y, objSolid);
                mySolid.image_yscale = 4;
        }
            
        with objSectionSwitcher
        {
            global.frozen = false;
            objMegaman.visible = true;
            instance_destroy();
            with objMegaman playerDeactivateObjects();
        }
        
        closing = false;
        image_speed = 0;
    }
}

