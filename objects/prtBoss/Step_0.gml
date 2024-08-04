if !global.frozen
{   
    if isIntro 
    {
        if y < ystart
            gravityNoGround();
        else
        {
            y = ystart;
            sprite_index = pose;
            yspeed = 0;
            
            if image_speed == 0
                image_index = 0;
            image_speed = poseImgSpeed;
            
            if image_index >= image_number-1
            {
                image_index = image_number-1;
                image_speed = 0;
                isIntro = false;
            }
        }
    }
    
    
    // Starting the actual fight
    if startFight 
    {
        startFight = false;
        isFight = true;
    }
    
    
    // Hitspark and death
    if healthpoints < prevHealthPoints
    {
        if healthpoints > 0
        {
            canHit = false;
            alarm[9] = 1;
            alarm[10] = 45; // Being able to get hit again
            drawBoss = true;
            drawHitSpark = false;
            
            global.bossHealth = healthpoints;
        }
        else
        {
            global.bossHealth = 0;
            audio_stop_all();
            playSFX(sfxDeath);
            
            var i, explosionID;
                
            i = 0;
            repeat 8
            {
                explosionID = instanceCreate(x, y, objMegamanExplosion);
                    explosionID.dir = i;
                    explosionID.spd = 1.5;
                    
                i += 45;
            }
            
            i = 0;
            repeat 8
            {
                explosionID = instanceCreate(x, y, objMegamanExplosion);
                    explosionID.dir = i;
                    explosionID.spd = 2.5;
                    
                i += 45;
            }
            
            instance_destroy();
            instanceCreate(x, y, objBossDeathTimer);
        }
    }
    
    prevHealthPoints = healthpoints;
    
    
    x += xspeed;
    y += yspeed;
}
else
{
    if alarm[9] != -1
        alarm[9] += 1;
    if alarm[10] != -1
        alarm[10] += 1;
}

