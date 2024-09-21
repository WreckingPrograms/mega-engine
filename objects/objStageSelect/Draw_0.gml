// Register the X and Y coordinates of all panels
for (var i = 0; i <= 8; i += 1)
{
	xx[i] = 24 + ((i % columns) * 80);
	yy[i] = 24 + (floor(i / rows) * 64);
}


// Draw the selected panel
draw_sprite(sprStageSelectPanel, floor(imgIndex), xx[option], yy[option]);


// Draw the boss icons
for (var i = 0; i < 8; i += 1)
{
	var panelIndex = (i >= 4) ? i + 1 : i;
    if !global.bossDefeated[i]
        draw_sprite(sprStageSelectIcons, i, xx[panelIndex] + 8, yy[panelIndex] + 8);
}


// Draw MM's head in the middle
draw_sprite(sprMMStageSelect, option, xx[4] + 8, yy[4] + 8);

