/// @function mask_get_ycenter
/// @description Get the vertical center of the object this is called in, based on its mask
function mask_get_ycenter() {

	return round(y - sprite_get_yoffset(mask_index) + (sprite_get_height(mask_index)/2));


}
