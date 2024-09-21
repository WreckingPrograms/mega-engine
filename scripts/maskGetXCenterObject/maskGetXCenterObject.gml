// Get the horizontal center of a certain object, based on its mask sprite
function maskGetXCenterObject(inst)
{
	return round(inst.x - sprite_get_xoffset(inst.mask_index) + (sprite_get_width(inst.mask_index) / 2));
}
