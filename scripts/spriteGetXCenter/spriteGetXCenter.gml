// Get the horizontal center of the object this is called in, based on their sprite (not collision mask)
function spriteGetXCenter()
{
	return round(x - sprite_xoffset + (sprite_width / 2));
}
