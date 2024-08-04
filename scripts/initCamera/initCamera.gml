function initCamera()
{
	// Views (for easy access, as GMS2 doesn't have view variables anymore)
	if variable_global_exists("camera")
		camera_destroy(global.camera);
	global.camera = camera_create_view(0, 0, global.resolution[0], global.resolution[1], 0, noone, 0, 0, 9999, 9999);
	view_set_camera(0, global.camera);
	
	global.viewX = 0;
	global.viewY = 0;
	global.viewWidth = camera_get_view_width(global.camera);
	global.viewHeight = camera_get_view_height(global.camera);
}