event_inherited();

if global.frozen == false && dead == false
{
    if !instance_exists(bulletID)
    {
        if instance_exists(objMegaman)
        {
            if x >= objMegaman.x
                image_xscale = -1;
            else
                image_xscale = 1;
        }
        
        shooting = true;
        animTimer = 0;
        image_index = 2;
        bulletID = instance_create(x+(15+4)*image_xscale, y-2, objColtonBullet);
            bulletID.image_xscale = image_xscale;
        playSFX(sfxColtonShoot);
    }
    
    if shooting == true
    {
        animTimer += 0.15;
        
        if animTimer >= 1
        {
            animTimer = 0;
            
            switch image_index
            {
                case 2: image_index = 3; break;
                case 3: image_index = 4; break;
                case 4: shooting = false; image_index = 0; break;
            }
        }
    }
    else
    {
        animTimer += 0.05;
        if animTimer >= 1
        {
            animTimer = 0;
            
            switch image_index
            {
                case 0: image_index = 1; break;
                case 1: image_index = 0; break;
            }   
        }
    }
}
else
{
    if dead == true
    {
        shooting = false;
        animTimer = 0;
        image_index = 0;
    }
}

