event_inherited();

if !isFrozen() && !dead
{
    if instance_exists(objMegaman)
    {
        if distance_to_object(objMegaman) <= radius || shooting || image_index != 0
        {
            if !shooting
            {
                shootTimer += 1 * global.dt;
                if shootTimer >= 90
                {
                    image_index = 2;
                    animate = true;
                    shooting = true;
                    shootTimer = 0;
                }
				else if shootTimer >= 85
                {
                    image_index = 1;
                }
            }
            else
            {
                shootTimer += 1 * global.dt;
				if shootAmount == 2 && shootTimer >= 29
                {
                    shootTimer = 0;
                    shooting = false;
                    shootAmount = 0;
                    image_index = 0;
                }
                else if shootAmount == 2 && shootTimer >= 24
                {
                    animate = false;
                    image_index = 1;
                    animateTimer = 0;
                }
                else if shootAmount != 2 && shootTimer >= 30
                {
                    var shootID = instanceCreate(x + 8, y + 3, objBeakBullet);
                        shootID.image_index = col;
                        shootID.dir = 0;
                        shootID.xscale = 1;
                        
                    shootID = instanceCreate(x + 4, y + 2, objBeakBullet);
                        shootID.image_index = col;
                        shootID.dir = 45;
                        shootID.xscale = 1;
                            
                    shootID = instanceCreate(x, y, objBeakBullet);
                        shootID.image_index = col;
                        shootID.dir = 90;
                        shootID.xscale = 1;
                            
                    shootID = instanceCreate(x - 4, y + 2, objBeakBullet);
                        shootID.image_index = col;
                        shootID.dir = 135;
                        shootID.xscale = 1;
                            
                    shootID = instanceCreate(x - 8, y + 3, objBeakBullet);
                        shootID.image_index = col;
                        shootID.dir = 180;
                        shootID.xscale = 1;
                            
                    shootAmount += 1;
                    shootTimer = 0;
                    playSFX(sfxEnemyShootClassic);
                }
            }
            
            if animate 
            {
                animateTimer += 1 * global.dt;
                if animateTimer >= 4
                {
                    animateTimer = 0;
                    
                    switch image_index
                    {
                        case 2: image_index = 3; break;
                        case 3: image_index = 4; break;
                        case 4: image_index = 2; break;
                    }
                }
            }
        }
        else
        {
            if shootTimer < 85
                shootTimer += 1 * global.dt;
        }
    }
}
else
{
    if dead 
    {
        shootTimer = 0;
        shooting = false;
        shootAmount = 0;
        image_index = 0;
        animate = false;
        animateTimer = 0;
    }
}

