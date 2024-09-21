if instance_exists(objMegaman)
{
    drawPlayer();
    
    // Weapon icon (when using quick weapon switching)
    if objMegaman.drawWeaponIcon 
    {
        if !objMegaman.climbing
            draw_sprite_ext(sprWeaponIconsColor, global.weapon, objMegaman.x - 8 + objMegaman.image_xscale, objMegaman.y - 30, 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(sprWeaponIconsColor, global.weapon, objMegaman.x - 8, objMegaman.y - 30, 1, 1, 0, c_white, 1);
    }
}

