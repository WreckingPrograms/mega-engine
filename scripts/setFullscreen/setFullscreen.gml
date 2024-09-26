// Turns fullscreen on or off, and sets window sizes accordingly
function setFullscreen(enable)
{
	if window_get_fullscreen() == enable
		return;
		
	window_set_fullscreen(enable);
	
	if enable
	{
		var scale = display_get_height() / global.resolution[1];
		if global.enablePixelPerfectWindowScaling
			scale = floor(scale);
			
		setWindowScale(scale);
		view_set_wport(0, round(global.resolution[0] * scale));
		view_set_hport(0, round(global.resolution[1] * scale));
		
		// With pixel-perfect scaling, the game (application surface) is still rendered
		// manually to enforce said scaling
		if global.enablePixelPerfectWindowScaling && !global.enableWindowBorders
			application_surface_draw_enable(false);
	}
	else
	{
		setWindowScale(global.windowScale);
		
		if global.enablePixelPerfectWindowScaling && !global.enableWindowBorders
			application_surface_draw_enable(true);
	}
}