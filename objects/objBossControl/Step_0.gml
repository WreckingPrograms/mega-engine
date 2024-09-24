if x >= global.viewX && x <= global.viewX + global.viewWidth - 1
	&& y >= global.viewY && y <= global.viewY + global.viewHeight - 1
{
    // Locks the player and activates the boss (but won't make the boss move yet, it just performs its starting pose)
    // Also plays the boss music
    if canInitDeactivation 
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
    
    
    // Preparing to fill the health bar
    if canFillHealthBar 
    {
        healthBarTimer += 1 * global.dt;
        if healthBarTimer >= healthBarTimerMax
        {
            healthBarTimer = 0;
            canFillHealthBar = false;
            fillingHealthBar = true;
            audio_stop_sound(sfxEnergyRestore);
            playSFX(sfxEnergyRestore, true);
            drawHealthBar = true;
        }
    }
    
    
    // Filling the health bar
    if fillingHealthBar 
    {
        healthBarTimer += 1 * global.dt;
        if healthBarTimer >= 3
        {
            global.bossHealth += 1;
            healthBarTimer -= 3;
        }
        
        if global.bossHealth >= 28
        {
            global.bossHealth = 28;
            audio_stop_sound(sfxEnergyRestore);
            playerFreeMovement();
            myBoss.startFight = true;
            fillingHealthBar = false;
        }
    }
}

