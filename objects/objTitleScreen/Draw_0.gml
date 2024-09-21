draw_sprite(sprLogo, 0, round(room_width / 2), round(room_height / 2) - 35);

var oldCol = draw_get_color();
draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_halign(fa_center);

draw_text(round(room_width / 2), room_height - 40, "CREATED BY WRECKINGPROGRAMS\n2016-2024\n\nPLEASE GIVE CREDIT");

if drawText 
{
    draw_text(round(room_width / 2), 125, "PRESS THE SPACE BAR");
}


draw_set_color(oldCol);
draw_set_halign(fa_left);

