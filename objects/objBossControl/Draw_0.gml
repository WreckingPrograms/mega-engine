if drawHealthBar 
{
	var healthBarX = global.viewX + 36;
	var healthBarY = global.viewY + 17;
    draw_sprite(sprHealthbarBackground, 0, healthBarX, healthBarY);
    
    for (var i = 1; i <= global.bossHealth; i += 1)
    {
        draw_sprite_ext(sprHealthbarPrimary, 0, healthBarX + 1, healthBarY + (sprite_get_height(sprHealthbarBackground) - (i * 2)),
			1, 1, 0, healthBarPrimaryCol, 1);
        draw_sprite_ext(sprHealthbarSecondary, 0, healthBarX + 1, healthBarY + (sprite_get_height(sprHealthbarBackground) - (i * 2)),
			1, 1, 0, healthBarSecondaryCol, 1);
    }
}

