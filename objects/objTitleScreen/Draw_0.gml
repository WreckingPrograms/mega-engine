draw_sprite(sprLogo, 0, round(room_width/2), round(room_height/2)-35);


var oldCol;
oldCol = draw_get_color();
draw_set_color(c_white);
draw_set_font(global.MM3font);
draw_set_halign(fa_center);

draw_text(round(room_width/2), room_height-40, string_hash_to_newline("CREATED BY WRECKINGPROGRAMS#2016-2024##PLEASE GIVE CREDIT"));

if drawText == true
{
    draw_text(round(room_width/2), 125, string_hash_to_newline("PRESS THE SPACE BAR"));
}


draw_set_color(oldCol);
draw_set_halign(fa_left);

