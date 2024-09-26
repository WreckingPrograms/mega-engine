if instance_exists(objMegaman)
{
    x = objMegaman.x;
    y = objMegaman.y;
}

// Debug keys
if keyboard_check_pressed(vk_f3)
{
	if window_get_fullscreen()
	{
		setFullscreen(false);
		delay(5, function() {
			
			// Centering the window doesn't work when immediately leaving fullscreen,
			// so do this with a small delay
			setWindowScale(global.windowScale);
			
		});
	}
	else if global.windowScale < 4
	{
		global.windowScale++;
		setWindowScale(global.windowScale);
	}
	else
	{
		global.windowScale = 1;
		setFullscreen(true);
	}
}

if keyboard_check_pressed(vk_f4)
    setFullscreen(!window_get_fullscreen());