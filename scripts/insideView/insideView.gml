// / @function insideView
// / @description Returns true if the object is inside the view, and false if not
function insideView() {

	if spriteGetXCenter() >= global.viewX && spriteGetXCenter() <= global.viewX+global.viewWidth
	&& spriteGetYCenter() >= global.viewY && spriteGetYCenter() <= global.viewY+global.viewHeight
	    return true;
	else
	    return false;


}
