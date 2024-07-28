if teleporting == false && teleportingUp == false
{
    drawSelf();
}
else if teleporting == true
{
    if round(global.viewY-32+teleportY) >= y && shouldLand == true
    {
        if teleportTimer == 0
            playSFX(sfxTeleportIn);
        
        //Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   //Rush disappears for one frame
            drawSelf();
        
        if teleportTimer == 2
            image_index = 1;
        else if teleportTimer == 4
            image_index = 0;
        else if teleportTimer == 6
            image_index = 2;
        else if (teleportTimer = 9 && collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false) < 0)
        || (teleportTimer == 15 && collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false) >= 0)
        {
            teleporting = false;
            teleportTimer = 0;
            teleportY = 0;
            if collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false) < 0
                canCoil = true;
            sprite_index = sprRushJet;
            dead = false;
            mask_index = sprRushJet;
            exit;
        }
        
        if global.frozen == false
            teleportTimer += 1;
    }
    else if round(global.viewY-32+teleportY) >= global.viewY+global.viewHeight
    {
        instance_destroy();
    }
    else
    {
        //Teleporting downwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(global.viewY-32+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        
        if global.frozen == false
            teleportY += 7;
    }
}
else if teleportingUp == true
{
    if teleportY == 0
    {
        //Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   //Rush disappears for one frame
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
        
        if global.frozen == false
            teleportTimer += 1;
    }
    else
    {
        //Teleporting upwards
        draw_sprite_ext(sprite_index, image_index, round(x), round(y+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        
        if global.frozen == false
            teleportY -= 7;
        
        if round(y+teleportY) <= global.viewY || round(y+teleportY) <= 0
            instance_destroy();
    }
}

