var xx = 78;
var yy1 = 171;
var yy2 = yy1 + 16;

draw_sprite(sprPassText, !canSelectOption, 88, 164); // 1 when game over, 0 otherwise

if canSelectOption 
{
    if option == 0
        draw_sprite(sprPassArrow, 0, xx, yy1);
    else
        draw_sprite(sprPassArrow, 0, xx, yy2);
}

