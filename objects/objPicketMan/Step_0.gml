event_inherited();

if !isFrozen() && !dead
{
    if instance_exists(objMegaman)
    {
        if x < objMegaman.x
            image_xscale = 1;
        else
            image_xscale = -1;
    }
    
    if !shooting
    {
        shootTimer += 1;
        if shootTimer >= 120
        {
            shootTimer = 0;
            shooting = true;
            image_index = 1;
            shootAmountMax = choose(5, 10);
        }
    }
    else
    {
        shootTimer += 1;
        if shootTimer == 15
        {
            image_index = 2;
            var shootID = instanceCreate(x + (image_xscale * 16), spriteGetYCenter(), objPicket);
                shootID.image_xscale = image_xscale;
            
            shootAmount += 1;
        }
        else if shootTimer == 30
        {
            if shootAmount >= shootAmountMax
            {
                image_index = 0;
                shooting = false;
                shootAmount = 0;
            }
            else
            {
                image_index = 1;
            }
            
            shootTimer = 0;
        }
    }
    
    
    // Set the protection of the Picketman
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
        shooting = false;
        shootAmount = 0;
        image_index = 0;
    }
}

