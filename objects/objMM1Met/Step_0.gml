event_inherited();

if !isFrozen() && !dead
{
    if instance_exists(objMegaman)
    {
        if x < objMegaman.x
            image_xscale = 1;
        else
            image_xscale = -1;
        
        if distance_to_object(objMegaman) <= radius
        {
            if canShoot 
            {
                canShoot = false;
                image_index = 1;
            }
        }
    }
    
    if !canShoot
    {
        cooldownTimer += 1 * global.dt;
        
        if cooldownTimer >= 17 && shootPhase == 0
        {
            // Shoot
            var ID;
            ID = instanceCreate(x + (image_xscale * 8), spriteGetYCenter(), objMM1MetBullet);
                ID.dir = 45;
                ID.xscale = image_xscale;
            ID = instanceCreate(x + (image_xscale * 8), spriteGetYCenter(), objMM1MetBullet);
                ID.dir = 0;
                ID.xscale = image_xscale;
            ID = instanceCreate(x + (image_xscale * 8), spriteGetYCenter(), objMM1MetBullet);
                ID.dir = -45;
                ID.xscale = image_xscale;
            
            playSFX(sfxEnemyShootClassic);
			shootPhase = 1;
        }
        else if cooldownTimer >= 30 && shootPhase == 1
        {
            image_index = 0;
			shootPhase = 2;
        }
        else if cooldownTimer >= 80
        {
            canShoot = true;
            cooldownTimer = 0;
			shootPhase = 0;
        }
    }
    
    // Set the protection of the Met
    if image_index == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
}
else
{
    if dead 
    {
        cooldownTimer = 0;
		shootPhase = 0;
        canShoot = true;
        image_index = 0;
    }
}

