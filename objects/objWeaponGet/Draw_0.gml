draw_sprite_ext(megaSpr, megaImg, megaX, megaY, 1, 1, 0, c_white, 1);


draw_set_font(global.MM3font);

var oldCol, oldAlpha;
oldCol = draw_get_color();
oldAlpha = draw_get_alpha();
draw_set_color(c_white);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var textX, textY;
textX = round(global.viewX + (global.viewWidth/3));
textY = round(global.viewY + (global.viewHeight*0.4));

if phase >= 6
{
    //Draw "You got"
    draw_set_alpha(text1Alpha);
    draw_text(textX, textY, string_hash_to_newline("YOU GOT"));
    draw_set_alpha(1);
}

if phase >= 7
{
    //Draw the weapon name
    draw_set_alpha(text2Alpha);
    draw_text(textX, textY+25, string_hash_to_newline(global.bossWeaponName));
    draw_set_alpha(1);
}

if phase == 8
{
    //Flickering
    if timer mod 2 == 0
    {
        draw_sprite_ext(sprMegamanWeaponGetPrimary, megaImg, megaX, megaY, 1, 1, 0, global.bossWeaponPrimary, 1);
        draw_sprite_ext(sprMegamanWeaponGetPrimaryDark, megaImg, megaX, megaY, 1, 1, 0, global.bossWeaponPrimaryDark, 1);
        draw_sprite_ext(sprMegamanWeaponGetSecondary, megaImg, megaX, megaY, 1, 1, 0, global.bossWeaponSecondary, 1);
    }
}
else if phase == 9
{
    draw_sprite_ext(sprMegamanWeaponGetPrimary, megaImg, megaX, megaY, 1, 1, 0, global.bossWeaponPrimary, 1);
    draw_sprite_ext(sprMegamanWeaponGetPrimaryDark, megaImg, megaX, megaY, 1, 1, 0, global.bossWeaponPrimaryDark, 1);
    draw_sprite_ext(sprMegamanWeaponGetSecondary, megaImg, megaX, megaY, 1, 1, 0, global.bossWeaponSecondary, 1);
}


draw_set_color(oldCol);
draw_set_color(oldAlpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

