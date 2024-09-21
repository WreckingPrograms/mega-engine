// Get the very left of the object this is called in, based on their sprite (not collision mask)
function spriteGetLeft()
{
	return round(x - sprite_xoffset);
}
