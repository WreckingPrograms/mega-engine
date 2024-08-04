// Health
draw_sprite(sprHealthbarBackground, 0, global.viewX+7+8+5, global.viewY+17);

for (i = 1; i <= global._health; i += 1)
{
    draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+7+8+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(252, 228, 160), 1);
    draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+7+8+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, make_color_rgb(248, 248, 248), 1);
}


// Weapons
if global.weapon != 0
{
    draw_sprite(sprHealthbarBackground, 0, global.viewX+7+5, global.viewY+17);
    
    for (i = 1; i <= ceil(global.ammo[global.currentWeapon]); i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, global.viewX+7+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.primaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, global.viewX+7+1+5, global.viewY+17+(sprite_get_height(sprHealthbarBackground)-i*2), 1, 1, 0, global.secondaryCol, 1);
    }
}

