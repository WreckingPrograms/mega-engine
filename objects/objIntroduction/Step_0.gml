// Moving the lines
for (var i = 0; i < totalLinesUp; i += 1)
{
    lineUpY[i] -= lineSpd * global.dt;
    
    if lineUpY[i] < -28 && createLineUp[i] 
    {
        totalLinesUp += 1;
        lineUpY[totalLinesUp - 1] = round(room_height / 2) - 14;
        createLineUp[totalLinesUp - 1] = true;
        
        createLineUp[i] = false;
    }
}

for (var i = 0; i < totalLinesDown; i += 1)
{
    lineDownY[i] += lineSpd * global.dt;
    
    if lineDownY[i] > room_height && createLineDown[i] 
    {
        totalLinesDown += 1;
        lineDownY[totalLinesDown - 1] = round(room_height / 2) - 14;
        createLineDown[totalLinesDown - 1] = true;
        
        createLineDown[i] = false;
    }
}


// Boss animation
if startPoseTimer < startPoseTimerMax
{
    bossSprite = standSprite;
    startPoseTimer += 1 * global.dt;
}
else
{
    bossSprite = pose;
    bossImg += poseImgSpeed * global.dt;
    if bossImg >= sprite_get_number(pose) - 1
    {
        bossImg = sprite_get_number(pose) - 1;
    }
}


// Fading the boss in (it's black at the beginning, then starts gaining its own color)
if bossRGB < 255
{
    bossRGBTimer += 1 * global.dt;
    if bossRGBTimer >= bossRGBTimerMax
    {
        bossRGBTimer -= bossRGBTimerMax;
        bossRGB += ceil(255 / 4);
        if bossRGB > 255
            bossRGB = 255;
    }
}


// Boss text
if bossTextTimer < bossTextTimerMax
{
    bossTextTimer += 1 * global.dt;
}
else
{
    if bossTextPos < string_length(name)
    {
        bossTextIntervalTimer += 1 * global.dt;
        if bossTextIntervalTimer >= bossTextInterval
        {
            bossTextIntervalTimer -= bossTextInterval;
            bossTextPos += 1;
            bossDisplayName = string_copy(name, 0, bossTextPos);
        }
    }
}

