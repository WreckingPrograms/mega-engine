// / @function maskGetYCenterObject
// / @param obj
// / @description Get the vertical center of a certain object, based on its mask
function maskGetYCenterObject(argument0) {

	var v;
	v = argument0;
	return round(v.y - sprite_get_yoffset(v.mask_index) + (sprite_get_height(v.mask_index)/2));


}