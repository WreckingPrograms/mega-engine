/// @function sprite_get_xcenter
/// @description Get the horizontal center of the object this is called in
function sprite_get_xcenter() {

	return round(x - sprite_xoffset + (sprite_width/2));


}
