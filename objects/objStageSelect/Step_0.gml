if !selected
{
    // Moving the selection
	var prevOption = option;
    if global.keyRightPressed
    {
		if option % columns == columns - 1
		{
			// On right; wrap around to left side
			option = floor(option / columns) * columns;
		}
		else
		{
			option++;
		}
    }
    else if global.keyLeftPressed
    {
        if option % columns == 0
		{
			// On left; wrap around to right side
			option = (floor(option / columns) * columns) + columns - 1;
		}
		else
		{
			option--;
		}
    }
    
    if global.keyDownPressed
    {
        if floor(option / rows) == rows - 1
		{
			// On bottom; wrap around to top side
			option = option % columns;
		}
		else
		{
			option += rows;
		}
    }
    else if global.keyUpPressed
    {
        if floor(option / rows) == 0
		{
			// On top; wrap around to bottom side
			option = ((rows - 1) * columns) + option % columns;
		}
		else
		{
			option -= rows;
		}
    }
	
	if option != prevOption
	{
		playSFX(sfxMenuMove);
	}
    
    
    
    // Selecting a stage
    if global.keyPausePressed && option != 8
    {
        playSFX(sfxMenuSelect);
        
        // Add more bosses once they are added
        switch option
        {
            case 3: // Pharaoh Man; currently the only selectable boss
                selected = true;
                
                global.destinationLevel = rmBeta; // The level to go to after the boss introduction
                global.introductionBoss = "pharaoh";
                global.introBGCol = make_color_rgb(255, 145, 95); // The background color of the boss introduction screen
                global.introLineCol = make_color_rgb(255, 204, 174); // The color of the moving lines in the boss introduction screen
            break;
        }
		
		if selected
		{
			var ID = instanceCreate(0, 0, objFadeout);
                ID.type = "room";
                    
            if !global.bossDefeated[option]
                ID.myRoom = rmIntroduction;
            else
                ID.myRoom = global.destinationLevel;
				
			global.levelStart = true;
		}
    }
}


// Animation
imgIndex += imgSpd;
if imgIndex >= 2
    imgIndex -= 2;

