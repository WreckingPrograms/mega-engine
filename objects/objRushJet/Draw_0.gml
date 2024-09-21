if !teleporting && !teleportingUp
{
    drawSelf();
}
else if teleporting 
{
	var teleDrawY = global.viewY - 32 + teleportY;
    if teleDrawY >= y && shouldLand 
    {
        if teleportTimer == 0
            playSFX(sfxTeleportIn);
        
        // Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   // Rush disappears for one frame
            drawSelf();
        
        if teleportTimer == 2
            image_index = 1;
        else if teleportTimer == 4
            image_index = 0;
        else if teleportTimer == 6
            image_index = 2;
        else if (teleportTimer = 9 && collision_rectangle(x - 5, bbox_top, x + 5, bbox_bottom, objSolid, false, false) < 0)
			|| (teleportTimer == 15 && collision_rectangle(x - 5, bbox_top, x + 5, bbox_bottom, objSolid, false, false) >= 0)
        {
            teleporting = false;
            teleportTimer = 0;
            teleportY = 0;
            if collision_rectangle(x - 5, bbox_top, x + 5, bbox_bottom, objSolid, false, false) < 0
                canCoil = true;
            sprite_index = sprRushJet;
            dead = false;
            mask_index = sprRushJet;
            exit;
        }
        
        if !isFrozen()
            teleportTimer += 1;
    }
    else if teleDrawY >= global.viewY+global.viewHeight
    {
        instance_destroy();
    }
    else
    {
        // Teleporting downwards
        draw_sprite_ext(sprite_index, image_index, x, teleDrawY, image_xscale, image_yscale, image_angle, c_white, 1);
        
        if !isFrozen()
            teleportY += 7;
    }
}
else if teleportingUp 
{
    if teleportY == 0
    {
        // Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   // Rush disappears for one frame
            drawSelf();
        
        if teleportTimer == 2
            image_index = 2;
        else if teleportTimer == 4
            image_index = 0;
        else if teleportTimer == 6
            image_index = 1;
        else if teleportTimer = 9
        {
            teleportY -= 7;
            image_speed = 0;
            image_index = 0;
            exit;
        }
        
        if !isFrozen()
            teleportTimer += 1;
    }
    else
    {
        // Teleporting upwards
        draw_sprite_ext(sprite_index, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, c_white, 1);
        
        if !isFrozen()
            teleportY -= 7;
        
        if y + teleportY <= global.viewY || y + teleportY <= 0
            instance_destroy();
    }
}

