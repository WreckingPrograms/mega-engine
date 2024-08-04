// / @function maskGetXCenter
// / @description Get the horizontal center of the object this is called in, based on its mask
function maskGetXCenter() {

	return round(x - sprite_get_xoffset(mask_index) + (sprite_get_width(mask_index)/2));


}
