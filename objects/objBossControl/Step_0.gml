if x >= global.viewX && x <= global.viewX+global.viewWidth-1
&& y >= global.viewY && y <= global.viewY+global.viewHeight-1
{
    //Locks the player and activates the boss (but won't make the boss move yet, it just performs its starting pose)
    //Also plays the boss music
    if canInitDeactivation == true
    {
        canInitDeactivation = false;
        playerLockMovement();
        
        myBoss.startIntro = true;
        
        if musicVolume != -1 && musicLoopPointStart != -1
            playMusicVolumeLoopPoint(music, musicVolume, musicLoopPointStart, musicLoopPointEnd);
        else if musicVolume != -1
            playMusicVolume(music, musicVolume);
        else if musicLoopPointStart != -1
            playMusicLoopPoint(music, musicLoopPointStart, musicLoopPointEnd);
        else
            playMusic(music);            
    }
    
    
    //Preparing to fill the health bar
    if canFillHealthBar == true
    {
        healthBarTimer += 1;
        if healthBarTimer >= healthBarTimerMax
        {
            healthBarTimer = 0;
            canFillHealthBar = false;
            fillingHealthBar = true;
            sound_stop(sfxEnergyRestore);
            sound_loop(sfxEnergyRestore);
            drawHealthBar = true;
        }
    }
    
    
    //Filling the health bar
    if fillingHealthBar == true
    {
        healthBarTimer += 1;
        if healthBarTimer >= 3
        {
            global.bossHealth += 1;
            healthBarTimer = 0;
        }
        
        if global.bossHealth >= 28
        {
            global.bossHealth = 28;
            sound_stop(sfxEnergyRestore);
            playerFreeMovement();
            myBoss.startFight = true;
            fillingHealthBar = false;
        }
    }
}

