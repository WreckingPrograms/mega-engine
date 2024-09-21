// Returns whether or not the object is inside the view
function insideView()
{
	return (spriteGetXCenter() >= global.viewX && spriteGetXCenter() <= global.viewX + global.viewWidth
		&& spriteGetYCenter() >= global.viewY && spriteGetYCenter() <= global.viewY + global.viewHeight);
}
