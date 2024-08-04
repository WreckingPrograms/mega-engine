if !selected
{
    // Moving the selection
    var soundPlayed;
    soundPlayed = false; // Prevents the menu move sound from playing twice when two buttons are pressed at the same time
    if global.keyRightPressed
    {
        switch option
        {
            case 0: option = 1; break;
            case 1: option = 2; break;
            case 2: option = 0; break;
            case 3: option = 7; break;
            case 4: option = 6; break;
            case 5: option = 4; break;
            case 6: option = 5; break;
            case 7: option = 8; break;
            case 8: option = 3; break;
        }
        
        if !soundPlayed
        {
            playSFX(sfxMenuMove);
            soundPlayed = true;
        }
    }
    else if global.keyLeftPressed
    {
        switch option
        {
            case 0: option = 2; break;
            case 1: option = 0; break;
            case 2: option = 1; break;
            case 3: option = 8; break;
            case 4: option = 5; break;
            case 5: option = 6; break;
            case 6: option = 4; break;
            case 7: option = 3; break;
            case 8: option = 7; break;
        }
        
        if !soundPlayed
        {
            playSFX(sfxMenuMove);
            soundPlayed = true;
        }
    }
    
    if global.keyDownPressed
    {
        switch option
        {
            case 0: option = 7; break;
            case 1: option = 8; break;
            case 2: option = 3; break;
            case 3: option = 4; break;
            case 4: option = 2; break;
            case 5: option = 1; break;
            case 6: option = 0; break;
            case 7: option = 6; break;
            case 8: option = 5; break;
        }
        
        if !soundPlayed
        {
            playSFX(sfxMenuMove);
            soundPlayed = true;
        }
    }
    else if global.keyUpPressed
    {
        switch option
        {
            case 0: option = 6; break;
            case 1: option = 5; break;
            case 2: option = 4; break;
            case 3: option = 2; break;
            case 4: option = 3; break;
            case 5: option = 8; break;
            case 6: option = 7; break;
            case 7: option = 0; break;
            case 8: option = 1; break;
        }
        
        if !soundPlayed
        {
            playSFX(sfxMenuMove);
            soundPlayed = true;
        }
    }
    
    
    
    // Selecting a stage
    if global.keyPausePressed && option != 8
    {
        playSFX(sfxMenuSelect);
        
        // Add more bosses once they are added
        switch option
        {
            case 7: // Pharaoh Man; currently the only selectable boss
                selected = true;
                
                global.destinationLevel = rmBeta; // The level to go to after the boss introduction
                global.introductionBoss = "pharaoh";
                global.introBGCol = make_color_rgb(255, 145, 95); // The background color of the boss introduction screen
                global.introLineCol = make_color_rgb(255, 204, 174); // The color of the moving lines in the boss introduction screen
                
                var ID;
                ID = instanceCreate(0, 0, objFadeout);
                    ID.type = "room";
                    
                if !global.bossDefeated[option]
                    ID.myRoom = rmIntroduction;
                else
                    ID.myRoom = global.destinationLevel;
            break;
        }
    }
}


// Animation
imgIndex += imgSpd;
if imgIndex >= 2
    imgIndex -= 2;

