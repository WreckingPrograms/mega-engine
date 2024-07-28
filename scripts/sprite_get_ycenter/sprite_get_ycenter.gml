/// @function sprite_get_ycenter
/// @description Get the vertical center of the object this is called in
function sprite_get_ycenter() {

	return round(y - sprite_yoffset + (sprite_height/2));


}
