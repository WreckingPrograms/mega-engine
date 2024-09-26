// Place this object at the topleft corner of the screen your boss is in!
// This handles the boss health bar, as well as locking the player and boss movement at the start

// Variable definitions:
// music = mscBoss (just the asset name of the music you're using for the boss)
// musicVolume = 0-1 (the volume of the music; optional)
// musicLoopPointStart = 0-1 (the starting loop point of the music; optional)
// musicLoopPointEnd = 0-1 (the ending of the loop of the music; if musicLoopPointStart is used, this one is required)
// healthBarPrimaryCol = [col] (the color of the left/right of the boss's health bar)
// healthBarSecondaryCol = [col] (the color of the middle of the boss's health bar)
    
    
drawHealthBar = false;
canFillHealthBar = true;
fillingHealthBar = false;
healthBarTimer = 0;
healthBarTimerMax = 100;

canInitDeactivation = true;

myBoss = instance_nearest(x, y, prtBoss);
if myBoss == noone
{
	show_message("objBossControl could not find a boss. Exiting game!");
	game_end();
}

global.bossHealth = 0;


function drawHud(baseX, top, scale=1)
{
	if !drawHealthBar
		return;
		
	var healthBarX = global.enableWindowBorders && global.drawHudOnWindowBorders
		? baseX + (8 * scale)
		: baseX + (36 * scale);
	var healthBarY = top + (17 * scale);
	draw_sprite_ext(sprHealthbarBackground, 0, healthBarX, healthBarY, scale, scale, 0, c_white, 1);
    
	for (var i = 1; i <= global.bossHealth; i += 1)
	{
	    draw_sprite_ext(sprHealthbarPrimary, 0, healthBarX + scale,
			healthBarY + ((sprite_get_height(sprHealthbarBackground) - (i * 2)) * scale),
			scale, scale, 0, healthBarPrimaryCol, 1);
	    draw_sprite_ext(sprHealthbarSecondary, 0, healthBarX + scale,
			healthBarY + ((sprite_get_height(sprHealthbarBackground) - (i * 2)) * scale),
			scale, scale, 0, healthBarSecondaryCol, 1);
	}
}