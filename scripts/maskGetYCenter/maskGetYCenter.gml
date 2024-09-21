// Get the vertical center of the object this is called in, based on its mask sprite
function maskGetYCenter()
{
	return round(y - sprite_get_yoffset(mask_index) + (sprite_get_height(mask_index) / 2));
}
