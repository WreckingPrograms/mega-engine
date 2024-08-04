// Fading in/out
if textAlphaIncrease 
{
    if textAlpha < 1
    {
        textAlphaTimer += 1;
        if textAlphaTimer >= textAlphaInterval
        {
            textAlphaTimer = 0;
            textAlpha += textAlphaIncreaseAmount;
        }
    }
    else
    {
        textAlphaTimer = 0;
    }
}
else
{
    if textAlpha > 0
    {
        textAlphaTimer += 1;
        if textAlphaTimer >= textAlphaInterval
        {
            textAlphaTimer = 0;
            textAlpha -= textAlphaIncreaseAmount;
        }
    }
    else
    {
        textAlphaTimer = 0;
        room_goto(rmTitleScreen);
    }
}



// Proceed to the next screen ("phase")
proceedTimer += 1;
if global.keyPausePressed || global.keyJumpPressed || global.keyShootPressed || proceedTimer >= proceedTimerMax
{
    textAlphaIncrease = false;
}

