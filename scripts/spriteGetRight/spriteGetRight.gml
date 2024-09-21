// Get the very right of the object this is called in, based on their sprite (not collision mask)
function spriteGetRight()
{
	return round(x - sprite_xoffset + sprite_width);
}
