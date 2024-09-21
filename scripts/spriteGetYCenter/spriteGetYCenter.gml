// Get the vertical center of the object this is called in, based on their sprite (not collision mask)
function spriteGetYCenter()
{
	return round(y - sprite_yoffset + (sprite_height / 2));
}
