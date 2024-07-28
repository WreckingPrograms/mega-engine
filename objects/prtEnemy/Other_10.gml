if other.object_index != objPharaohShotCharging
{
    with other
    {
        var ID;
        ID = instance_create(x, y, objReflectedProjectile);
            ID.sprite_index = sprite_index;
            ID.image_index = image_index;
            ID.image_speed = image_speed;
            ID.image_xscale = image_xscale;
            ID.dir = sign(xspeed);
            
        instance_destroy();
    }
    
    playSFX(sfxReflect);
}

