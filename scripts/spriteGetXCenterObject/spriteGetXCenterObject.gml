// Get the horizontal center of a certain object, based on their sprite (not collision mask)
function spriteGetXCenterObject(inst)
{
	return round(inst.x - inst.sprite_xoffset + (inst.sprite_width / 2));
}
