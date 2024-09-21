// Get the very top of the object this is called in, based on their sprite (not collision mask)
function spriteGetTop()
{
	return round(y - sprite_yoffset);
}
