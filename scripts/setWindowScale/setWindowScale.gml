// Changes the scale of the window (window size = base resolution * scale)
function setWindowScale(scale)
{		
	if global.enableWindowBorders
	{
		var aspectRatio = window_get_fullscreen()
			? display_get_width() / display_get_height()
			: 16 / 9; // Hardcoded 16:9 in windowed mode for now, but you may want to make this selectable
			
		global.windowSize = [round(global.resolution[1] * scale * aspectRatio), global.resolution[1] * scale];
	}
	else
	{
		global.windowSize = [global.resolution[0] * scale, global.resolution[1] * scale];
	}

	window_set_size(global.windowSize[0], global.windowSize[1]);
	window_set_position(
		round((display_get_width() / 2) - (global.windowSize[0] / 2)),
		round((display_get_height() / 2) - (global.windowSize[1] / 2)));
		
	view_set_wport(0, round(global.resolution[0] * scale));
	view_set_hport(0, round(global.resolution[1] * scale));
}