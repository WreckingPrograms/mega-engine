var barY = global.viewY + 17;

// Health
var healthBarX = global.viewX + 20;
draw_sprite(sprHealthbarBackground, 0, healthBarX, barY);

for (var i = 1; i <= global._health; i += 1)
{
    draw_sprite_ext(sprHealthbarPrimary, 0, healthBarX + 1, barY + (sprite_get_height(sprHealthbarBackground) - (i * 2)),
		1, 1, 0, make_color_rgb(252, 228, 160), 1);
    draw_sprite_ext(sprHealthbarSecondary, 0, healthBarX + 1, barY + (sprite_get_height(sprHealthbarBackground) - (i * 2)),
		1, 1, 0, make_color_rgb(248, 248, 248), 1);
}


// Weapons
if global.weapon != 0
{
	var weaponBarX = global.viewX + 12;
    draw_sprite(sprHealthbarBackground, 0, weaponBarX, barY);
    
    for (var i = 1; i <= ceil(global.ammo[global.currentWeapon]); i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, weaponBarX + 1, barY + (sprite_get_height(sprHealthbarBackground) - (i * 2)),
			1, 1, 0, global.primaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, weaponBarX + 1, barY + (sprite_get_height(sprHealthbarBackground) - (i * 2)),
			1, 1, 0, global.secondaryCol, 1);
    }
}

