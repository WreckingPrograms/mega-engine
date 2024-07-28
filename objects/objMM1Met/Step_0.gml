event_inherited();

if global.frozen == false && dead == false
{
    if instance_exists(objMegaman)
    {
        if x < objMegaman.x
            image_xscale = 1;
        else
            image_xscale = -1;
        
        if distance_to_object(objMegaman) <= radius
        {
            if canShoot == true
            {
                canShoot = false;
                image_index = 1;
            }
        }
    }
    
    if canShoot == false
    {
        cooldownTimer += 1;
        
        if cooldownTimer == 17
        {
            //Shoot
            var ID;
            ID = instance_create(x+image_xscale*8, sprite_get_ycenter(), objMM1MetBullet);
            {
                ID.dir = 45;
                ID.xscale = image_xscale;
            }
            ID = instance_create(x+image_xscale*8, sprite_get_ycenter(), objMM1MetBullet);
            {
                ID.dir = 0;
                ID.xscale = image_xscale;
            }
            ID = instance_create(x+image_xscale*8, sprite_get_ycenter(), objMM1MetBullet);
            {
                ID.dir = -45;
                ID.xscale = image_xscale;
            }
            
            playSFX(sfxEnemyShootClassic);
        }
        else if cooldownTimer == 30
        {
            image_index = 0;
        }
        else if cooldownTimer >= 80
        {
            canShoot = true;
            cooldownTimer = 0;
        }
    }
    
    //Set the protection of the Met
    if image_index == 0
        reflectProjectiles = true;
    else
        reflectProjectiles = false;
}
else
{
    if dead == true
    {
        cooldownTimer = 0;
        canShoot = true;
        image_index = 0;
    }
}

