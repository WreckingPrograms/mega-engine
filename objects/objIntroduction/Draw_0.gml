//The background
draw_sprite_ext(sprIntroBG, 0, 0, 0, 1, 1, 0, global.introBGCol, 1);

//The moving colored lines
var i;
for(i = 0; i < totalLinesUp; i += 1)
{
    draw_sprite_ext(sprIntroLines, 0, 0, lineUpY[i], 1, 1, 0, global.introLineCol, 1);
}

for(i = 0; i < totalLinesDown; i += 1)
{
    draw_sprite_ext(sprIntroLines, 0, 0, lineDownY[i], 1, 1, 0, global.introLineCol, 1);
}

//The moving white lines
for(i = 0; i < totalLinesUp; i += 1)
{
    draw_sprite(sprIntroWhiteLines, 0, 0, lineUpY[i]);
}

for(i = 0; i < totalLinesDown; i += 1)
{
    draw_sprite(sprIntroWhiteLines, 0, 0, lineDownY[i]);
}

//The panel the Robot Master stands in
draw_sprite(sprIntroPanel, 0, 0, 0);

//The Robot Master
draw_sprite_ext(bossSprite, floor(bossImg), round(room_width/2), round(room_height/2)-4, -1, 1, 0, make_color_rgb(bossRGB, bossRGB, bossRGB), 1);

//The text displaying the name of the Robot Master
draw_set_font(global.MM3font);
draw_set_halign(fa_left);
var oldCol;
oldCol = draw_get_color();
draw_set_color(c_white);

draw_text(round(room_width/2) - round(string_width(string_hash_to_newline(name))/2), 136, string_hash_to_newline(bossDisplayName));

draw_set_color(oldCol);

