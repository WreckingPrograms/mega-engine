//Timer for toggling the visibility of the "PRESS THE SPACE BAR" text
if canProceed == true
{
    drawTextTimer += 1;
    if drawTextTimer >= drawTextTimerMax
    {
        drawTextTimer = 0;
        drawText = !drawText;
    }
}

//Going to the stage select
if global.keyPausePressed && canProceed == true
{
    canProceed = false;
    drawText = false;
    playSFX(sfxMenuSelect);
    
    var ID;
    ID = instance_create(0, 0, objFadeout);
        ID.type = "room";
        ID.myRoom = rmStageSelect;
}

