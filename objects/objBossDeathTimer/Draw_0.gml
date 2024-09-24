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
			var floorTeleportTimer = floor(teleportTimer);
            if floorTeleportTimer == 2
                image_index = 2;
            else if floorTeleportTimer == 4
                image_index = 0;
            else if floorTeleportTimer == 6
                image_index = 1;
            else if floorTeleportTimer >= 9
            {
                teleportY -= 7 * global.dt;
                image_speed = 0;
                image_index = 0;
                exit;
            }
            
            if !isFrozen()
                teleportTimer += 1 * global.dt;
        }
        else
        {
            // Teleporting upwards            
            if !isFrozen()
                teleportY -= 7 * global.dt;
        }
        
        draw_sprite_ext(sprMegamanTeleport, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, c_white, 1);
        draw_sprite_ext(sprMegamanTeleportPrimary, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, global.primaryCol, 1);
        draw_sprite_ext(sprMegamanTeleportSecondary, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, global.secondaryCol, 1);
        draw_sprite_ext(sprMegamanTeleportOutline, image_index, x, y + teleportY, image_xscale, image_yscale, image_angle, global.outlineCol, 1);
    }
}

