// Get the very bottom of the object this is called in, based on their sprite (not collision mask)
function spriteGetBottom()
{
	return round(y - sprite_yoffset + sprite_height);
}
