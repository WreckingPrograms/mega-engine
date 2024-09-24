blackAlphaTimer += 1 * global.dt;

if blackAlphaTimer >= blackAlphaTimerMax
{
    blackAlpha -= blackAlphaDecrease;
    blackAlphaTimer -= blackAlphaTimerMax;
}

if blackAlpha <= 0 && canAlarm 
{
    delay(4, function() { instance_destroy(); });
    canAlarm = false;
}

