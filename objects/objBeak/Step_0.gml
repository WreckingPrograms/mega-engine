event_inherited();

if global.frozen == false && dead == false
{
    if shooting == false
    {
        shootTimer += 1;
        if shootTimer == 60+30
            image_index = 1;
        else if shootTimer == 67+30
            image_index = 2;
        else if shootTimer == 74+30
            image_index = 3;
        else if shootTimer == 77+30
        {
            shootTimer = 0;
            shooting = true;
        }
    }
    else
    {
        shootTimer += 1;
        if shootTimer == 1
        {
            var shootID;
            shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = 45;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
        }
        else if shootTimer == 31
        {
            var shootID;
            shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = 15;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
        }
        else if shootTimer == 61
        {
            var shootID;
            shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = -15;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
        }
        else if shootTimer == 91
        {
            var shootID;
            shootID = instance_create(x+image_xscale*16, y+8, objBeakBullet);
                shootID.image_index = col;
                shootID.dir = -45;
                shootID.xscale = dir;
                
            playSFX(sfxEnemyShootClassic);
                
            image_index = 2;
        }
        else if shootTimer == 91+7
        {
            image_index = 1;
        }
        else if shootTimer == 91+14
        {
            image_index = 0;
            shooting = false;
            shootTimer = 0;
        }
    }
    
    
    //Handle's the Beak's protection
    if image_index == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
}
else
{
    if dead == true
    {
        shootTimer = 0;
        shooting = false;
        image_index = 0;
    }
}

