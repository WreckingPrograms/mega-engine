// Timer for toggling the visibility of the "PRESS THE SPACE BAR" text
if canProceed 
{
    drawTextTimer += 1 * global.dt;
    if drawTextTimer >= drawTextTimerMax
    {
        drawTextTimer -= drawTextTimerMax;
        drawText = !drawText;
    }
}

// Going to the stage select
if global.keyPausePressed && canProceed 
{
    canProceed = false;
    drawText = false;
    playSFX(sfxMenuSelect);
    
    var ID = instanceCreate(0, 0, objFadeout);
        ID.type = "room";
        ID.myRoom = rmStageSelect;
}

