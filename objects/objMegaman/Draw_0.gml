if !teleporting && !showReady
{
    // Draws the player. Whitemasks will be used
    drawPlayer();
    
    // Hitspark
    if drawHitspark 
    {
        draw_sprite_ext(sprHitspark, 0, spriteGetXCenter(), spriteGetYCenter(), image_xscale, image_yscale, 0, c_white, 1);
    }
    
    // Weapon icon (when using quick weapon switching)
    if drawWeaponIcon 
    {
        if !climbing
            draw_sprite_ext(sprWeaponIconsColor, global.weapon, round(x-8) + image_xscale, round(y-30), 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(sprWeaponIconsColor, global.weapon, round(x-8), round(y-30), 1, 1, 0, c_white, 1);
    }
}
else if teleporting 
{   
    if round(global.viewY-32+teleportY) >= y
    {
        if teleportTimer == 0
            playSFX(sfxTeleportIn);
        
        // Done teleporting; play a little animation before giving Mega Man control
        if teleportTimer != 9   // MM disappears for one frame in MM6
            drawPlayer();
        
        if teleportTimer == 2
            image_index = 1;
        else if teleportTimer == 4
            image_index = 0;
        else if teleportTimer == 6
            image_index = 2;
        else if teleportTimer = 9
        {
            teleporting = false;
            teleportTimer = 0;
            canSpriteChange = true;
            canMove = true;
            teleportY = 0;
            canGravity = true;
            canPause = true;
            sprite_index = spriteStand;
            instance_activate_all();
            exit;
        }
        
        teleportTimer += 1;
    }
    else
    {
        // Teleporting downwards
        draw_sprite_ext(spriteTeleport, image_index, round(x), round(global.viewY-32+teleportY), image_xscale, image_yscale, image_angle, c_white, 1);
        draw_sprite_ext(sprMegamanTeleportPrimary, image_index, round(x), round(global.viewY-32+teleportY), image_xscale, image_yscale, image_angle, global.primaryCol, 1);
        draw_sprite_ext(sprMegamanTeleportSecondary, image_index, round(x), round(global.viewY-32+teleportY), image_xscale, image_yscale, image_angle, global.secondaryCol, 1);
        
        teleportY += 7;
    }
}
else if showReady 
{
    // Draw the READY text
    readyTimer += 1;
    
    var readyIndicator;
    readyIndicator = readyTimer mod 12;
    if readyIndicator >= 6 && readyIndicator <= 11 // For the last 7 frames of every 14 frames, show the READY text
        draw_sprite_ext(sprReady, 0, round(global.viewX+(global.viewWidth/2)), round(global.viewY+(global.viewHeight/2)), 1, 1, 0, c_white, 1);
        
    if readyTimer >= 72
    {
        readyTimer = 0;
        showReady = false;
        
        // Teleporting sequence
        teleporting = true;
        teleportY = 0;
        teleportTimer = 0;
        sprite_index = spriteTeleport;
    }
}

