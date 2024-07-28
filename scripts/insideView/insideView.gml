/// @function insideView
/// @description Returns true if the object is inside the view, and false if not
function insideView() {

	if sprite_get_xcenter() >= global.viewX && sprite_get_xcenter() <= global.viewX+global.viewWidth
	&& sprite_get_ycenter() >= global.viewY && sprite_get_ycenter() <= global.viewY+global.viewHeight
	    return true;
	else
	    return false;


}
