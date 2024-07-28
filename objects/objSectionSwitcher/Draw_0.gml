if instance_exists(objMegaman)
{
    drawPlayer();
    
    //Weapon icon (when using quick weapon switching)
    if objMegaman.drawWeaponIcon == true
    {
        if objMegaman.climbing == false
            draw_sprite_ext(sprWeaponIconsColor, global.weapon, round(objMegaman.x-8) + objMegaman.image_xscale, round(objMegaman.y-30), 1, 1, 0, c_white, 1);
        else
            draw_sprite_ext(sprWeaponIconsColor, global.weapon, round(objMegaman.x-8), round(objMegaman.y-30), 1, 1, 0, c_white, 1);
    }
}

