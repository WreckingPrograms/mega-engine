event_inherited();

if !isFrozen() && !dead
{
    if !shooting
    {
        shootTimer += 1 * global.dt;
       
        if shootTimer >= 107
        {
            shootTimer = 0;
            shooting = true;
        }
		else if shootTimer >= 104
            image_index = 3;
		else if shootTimer >= 97
            image_index = 2;
		else if shootTimer >= 90
            image_index = 1;
    }
    else
    {
        shootTimer += 1 * global.dt;
        if shootPhase == 0
        {
            var shootID = instanceCreate(x + (image_xscale * 16), y + 8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = 45;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
			shootPhase = 1;
        }
        else if shootTimer >= 31 && shootPhase == 1
        {
            var shootID = instanceCreate(x + (image_xscale * 16), y + 8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = 15;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
			shootPhase = 2;
        }
        else if shootTimer >= 61 && shootPhase == 2
        {
            var shootID = instanceCreate(x + (image_xscale * 16), y + 8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = -15;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
			shootPhase = 3;
        }
        else if shootTimer >= 91 && shootPhase == 3
        {
            var shootID = instanceCreate(x + (image_xscale * 16), y + 8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = -45;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
                
            image_index = 2;
			shootPhase = 4;
        }
        else if shootTimer >= 98 && shootPhase == 4
        {
            image_index = 1;
			shootPhase = 5;
        }
        else if shootTimer >= 105
        {
            image_index = 0;
            shooting = false;
            shootTimer = 0;
			shootPhase = 0;
        }
    }
    
    
    // Handle's the Beak's protection
    if image_index == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
}
else
{
    if dead 
    {
        shootTimer = 0;
		shootPhase = 0;
        shooting = false;
        image_index = 0;
    }
}

