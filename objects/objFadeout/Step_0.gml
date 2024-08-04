blackAlphaTimer += 1;

if blackAlphaTimer >= blackAlphaTimerMax
{
    blackAlpha += blackAlphaDecrease;
    blackAlphaTimer = 0;
}

if blackAlpha >= 1 && canAlarm 
{
    alarm[1] = 10;
    canAlarm = false;
}

