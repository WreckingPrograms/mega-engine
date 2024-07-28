if canSelectOption == true
{
    if selectedOption == false
    {
        if global.keyUpPressed || global.keyDownPressed
        {
            option = !option;
            playSFX(sfxMenuMove);
        }
        
        if global.keyJumpPressed || global.keyShootPressed || global.keyPausePressed
        {
            selectedOption = true;
            playSFX(sfxMenuSelect);
            
            var ID;
            ID = instance_create(x, y, objFadeout);
                ID.type = "room";
            
            if option == 0
                ID.myRoom = rmStageSelect;
            else
                ID.myRoom = global.passContinueRoom;
        }
    }
}

