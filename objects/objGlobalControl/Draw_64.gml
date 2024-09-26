// Render window borders, if enabled

if room == rmInit || (!global.enableWindowBorders && !(global.enablePixelPerfectWindowScaling && window_get_fullscreen()))
	return;
	
var windowBorderSprite = sprWindowBorderSample;

var windowWidth = global.windowSize[0] / (global.windowSize[1] / global.resolution[1]) * 3;
var windowHeight = global.resolution[1] * 3;

var borderScale = max(windowWidth / sprite_get_width(windowBorderSprite),
	windowHeight / sprite_get_height(windowBorderSprite));
var borderCenterX = surface_get_width(application_surface) / 2;
var borderCenterY = surface_get_height(application_surface) / 2;
var borderX = floor(borderCenterX - ((sprite_get_width(windowBorderSprite) * borderScale) / 2));
var borderY = floor(borderCenterY - ((sprite_get_height(windowBorderSprite) * borderScale) / 2));


gpu_set_blendenable(false); // Don't let the game screen blend into the border during alpha fades


// Draw the border
if global.enableWindowBorders
{
	draw_sprite_ext(windowBorderSprite, 0, borderX, borderY, borderScale, borderScale, 0, c_white, 1);
	
	if global.drawHudOnWindowBorders
	{
		with objHealthWeaponBar
			drawHud(0, borderY, windowHeight / global.resolution[1]);
		with objBossControl
			drawHud(surface_get_width(application_surface), borderY, windowHeight / global.resolution[1]);
	}
}

// Draw the game screen
if global.enablePixelPerfectWindowScaling && window_get_fullscreen()
{
	var gameScale = global.windowSize[1] / display_get_height();
	draw_surface_ext(application_surface,
		borderCenterX - (surface_get_width(application_surface) * gameScale / 2),
		borderCenterY - (surface_get_height(application_surface) * gameScale / 2),
		gameScale, gameScale, 0, c_white, 1);
}
else
{
	draw_surface(application_surface, 0, 0);
}


gpu_set_blendenable(true);