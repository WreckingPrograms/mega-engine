var oldCol, oldAlp;
oldCol = draw_get_color();
oldAlpha = draw_get_alpha();

draw_set_color(c_black);
draw_set_alpha(blackAlpha);

draw_rectangle(global.viewX, global.viewY, global.viewX+global.viewWidth, global.viewY+global.viewHeight, false);

draw_set_color(oldCol);
draw_set_alpha(oldAlpha);

