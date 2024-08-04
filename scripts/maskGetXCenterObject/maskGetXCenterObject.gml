// / @function maskGetXCenterObject
// / @param obj
// / @description Get the horizontal center of a certain object, based on its mask
function maskGetXCenterObject(argument0) {

	var v;
	v = argument0;
	return round(v.x - sprite_get_xoffset(v.mask_index) + (sprite_get_width(v.mask_index)/2));


}
