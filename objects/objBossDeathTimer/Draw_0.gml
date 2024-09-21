if isMM 
{
    if !teleporting
    {
        drawPlayer();
    }
    else
    {
        if teleportY == 0
        {
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
            if !isFrozen()
                teleportY -= 7;
        }
        
        draw_sprite_ext(sprMegamanTeleport, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, c_white, 1);
        draw_sprite_ext(sprMegamanTeleportPrimary, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, global.primaryCol, 1);
        draw_sprite_ext(sprMegamanTeleportSecondary, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, global.secondaryCol, 1);
        draw_sprite_ext(sprMegamanTeleportOutline, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, global.outlineCol, 1);
    }
}

