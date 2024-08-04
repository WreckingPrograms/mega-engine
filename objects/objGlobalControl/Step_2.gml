// Move the camera depending on the view variables
// These variables are here to make setting and getting the view easier
if room == rmInit
	exit;

camera_set_view_pos(global.camera, global.viewX, global.viewY);