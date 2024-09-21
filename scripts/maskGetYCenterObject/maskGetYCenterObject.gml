// Get the vertical center of a certain object, based on its mask sprite
function maskGetYCenterObject(inst)
{
	return round(inst.y - sprite_get_yoffset(inst.mask_index) + (sprite_get_height(inst.mask_index) / 2));
}
