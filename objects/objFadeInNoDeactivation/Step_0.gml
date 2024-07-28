blackAlphaTimer += 1;

if blackAlphaTimer >= blackAlphaTimerMax
{
    blackAlpha -= blackAlphaDecrease;
    blackAlphaTimer = 0;
}

if blackAlpha <= 0 && canAlarm == true
{
    alarm[1] = 4;
    canAlarm = false;
}

