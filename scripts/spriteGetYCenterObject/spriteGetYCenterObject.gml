// Get the vertical center of a certain object, based on their sprite (not collision mask)
function spriteGetYCenterObject(inst)
{
	return round(inst.y - inst.sprite_yoffset + (inst.sprite_height / 2));
}
