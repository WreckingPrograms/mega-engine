//Place this object at the topleft corner of the screen your boss is in!
//This handles the boss health bar, as well as locking the player and boss movement at the start

//Creation code:
//music = mscBoss (just the asset name of the music you're using for the boss)
//musicVolume = 0-1 (the volume of the music; optional)
//musicLoopPointStart = 0-1 (the starting loop point of the music; optional)
//musicLoopPointEnd = 0-1 (the ending of the loop of the music; if musicLoopPointStart is used, this one is required)
//healthBarPrimaryCol = [col] (the color of the left/right of the boss's health bar)
//healthBarSecondaryCol = [col] (the color of the middle of the boss's health bar)
    
healthBarPrimaryCol = make_color_rgb(255, 160, 68); //Orange
    
healthBarSecondaryCol = c_white;
    
drawHealthBar = false;
canFillHealthBar = true;
fillingHealthBar = false;
healthBarTimer = 0;
healthBarTimerMax = 100;

canInitDeactivation = true;

myBoss = instance_nearest(x, y, prtBoss);
global.bossHealth = 0;


musicVolume = -1;
musicLoopPointStart = -1;
musicLoopPointEnd = -1;

