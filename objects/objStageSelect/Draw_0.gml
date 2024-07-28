//Register the X and Y coordinates of all panels
var i;
for(i = 0; i <= 8; i += 1)
{
    switch i
    {
        case 0: xx[i] = 24; yy[i] = 24; break;
        case 1: xx[i] = 104; yy[i] = 24; break;
        case 2: xx[i] = 184; yy[i] = 24; break;
        case 3: xx[i] = 184; yy[i] = 88; break;
        case 4: xx[i] = 184; yy[i] = 152; break;
        case 5: xx[i] = 104; yy[i] = 152; break;
        case 6: xx[i] = 24; yy[i] = 152; break;
        case 7: xx[i] = 24; yy[i] = 88; break;
        case 8: xx[i] = 104; yy[i] = 88; break;
    }
}


//Draw the selected panel
draw_sprite(sprStageSelectPanel, floor(imgIndex), xx[option], yy[option]);


//Draw the boss icons
for(i = 0; i <= 7; i += 1)
{
    if global.bossDefeated[i] == false
        draw_sprite(sprStageSelectIcons, i, xx[i]+8, yy[i]+8);
}


//Draw MM's head in the middle
draw_sprite(sprMMStageSelect, option, xx[8]+8, yy[8]+8);

