increaseHealth = false;
increaseHealthAmount = 0;

increaseAmmo = false;
increaseAmmoAmount = 0;

increaseTimer = 0;


function drawHud(baseX, top, scale=1)
{
	var barY = top + (17 * scale);

	// Health
	var healthBarX = global.enableWindowBorders && global.drawHudOnWindowBorders
		? baseX - ((8 + sprite_get_width(sprHealthbarBackground)) * scale)
		: baseX + (20 * scale);
	draw_sprite_ext(sprHealthbarBackground, 0, healthBarX, barY, scale, scale, 0, c_white, 1);

	for (var i = 1; i <= global._health; i += 1)
	{
	    draw_sprite_ext(sprHealthbarPrimary, 0, healthBarX + scale,
			barY + ((sprite_get_height(sprHealthbarBackground) - (i * 2)) * scale),
			scale, scale, 0, make_color_rgb(252, 228, 160), 1);
	    draw_sprite_ext(sprHealthbarSecondary, 0, healthBarX + scale,
			barY + ((sprite_get_height(sprHealthbarBackground) - (i * 2)) * scale),
			scale, scale, 0, make_color_rgb(248, 248, 248), 1);
	}


	// Weapons
	if global.weapon != 0
	{
		var weaponBarX = healthBarX - (8 * scale);
	    draw_sprite_ext(sprHealthbarBackground, 0, weaponBarX, barY, scale, scale, 0, c_white, 1);
    
	    for (var i = 1; i <= ceil(global.ammo[global.currentWeapon]); i += 1)
	    {
	        draw_sprite_ext(sprHealthbarPrimary, 0, weaponBarX + scale,
				barY + ((sprite_get_height(sprHealthbarBackground) - (i * 2)) * scale),
				scale, scale, 0, global.primaryCol, 1);
	        draw_sprite_ext(sprHealthbarSecondary, 0, weaponBarX + scale,
				barY + ((sprite_get_height(sprHealthbarBackground) - (i * 2)) * scale),
				scale, scale, 0, global.secondaryCol, 1);
	    }
	}
	
	if global.enableWindowBorders && global.drawHudOnWindowBorders
	{
		// Extra HUD info on window borders
		draw_set_font(global.MM3font);
		var spaceBetweenIconAndValue = 6;
		var spaceBetweenIcons = 24; // Vertical
		var textWidth = string_width("00");
		var textHeight = 8;
		var textX = healthBarX + ((sprite_get_width(sprHealthbarBackground) - textWidth) * scale);
		var iconRight = textX - (spaceBetweenIconAndValue * scale);
		var baseCenterY = barY + ((sprite_get_height(sprHealthbarBackground) + 24) * scale);
		
		var oldCol = draw_get_color();
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		gpu_set_blendenable(true);
		
		for (var i = 0; i < 3; i++)
		{
			var baseSprite, primarySprite, secondarySprite, outlineSprite, value;
			switch i
			{
				case 0: default: // Lives
					baseSprite = sprLife;
					primarySprite = sprLifePrimary;
					secondarySprite = sprLifeSecondary;
					outlineSprite = sprLifeOutline;
					value = global._lives;
				break;
				
				case 1: // E-Tanks
					baseSprite = sprETank;
					primarySprite = sprETankPrimary;
					secondarySprite = sprETankSecondary;
					outlineSprite = sprETankOutline;
					value = global.eTanks;
				break;
				
				case 2: // M-Tanks
					baseSprite = sprMTank;
					primarySprite = sprMTankPrimary;
					secondarySprite = sprMTankSecondary;
					outlineSprite = sprMTankOutline;
					value = global.mTanks;
				break;
			}
			
			value = max(round(value), 0);
			var centerY = baseCenterY + (spaceBetweenIcons * i * scale);
			
			var iconX = iconRight - (sprite_get_width(baseSprite) * scale);
			var iconY = centerY - ((sprite_get_height(baseSprite) - sprite_get_yoffset(baseSprite)) * scale / 2);
			draw_sprite_ext(baseSprite, 0, iconX, iconY, scale, scale, 0, c_white, 1);
			draw_sprite_ext(primarySprite, 0, iconX, iconY, scale, scale, 0, global.primaryCol, 1);
			draw_sprite_ext(secondarySprite, 0, iconX, iconY, scale, scale, 0, global.secondaryCol, 1);
			draw_sprite_ext(outlineSprite, 0, iconX, iconY, scale, scale, 0, global.outlineCol, 1);
			
			var textY = centerY - (textHeight * scale / 2) + scale;
			var text = (value < 10) ? "0" + string(value) : string(value);
			draw_text_transformed(textX, textY, text, scale, scale, 0);
		}
		
		draw_set_color(oldCol);
		gpu_set_blendenable(false);
	}
}