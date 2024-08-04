// Timer for toggling the visibility of the "PRESS THE SPACE BAR" text
if canProceed 
{
    drawTextTimer += 1;
    if drawTextTimer >= drawTextTimerMax
    {
        drawTextTimer = 0;
        drawText = !drawText;
    }
}

// Going to the stage select
if global.keyPausePressed && canProceed 
{
    canProceed = false;
    drawText = false;
    playSFX(sfxMenuSelect);
    
    var ID;
    ID = instanceCreate(0, 0, objFadeout);
        ID.type = "room";
        ID.myRoom = rmStageSelect;
}

