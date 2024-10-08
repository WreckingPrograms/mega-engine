// Deflect a player projectile fired at the enemy
if other.object_index != objPharaohShotCharging
{
    with other
    {
        var ID = instanceCreate(x, y, objReflectedProjectile);
            ID.sprite_index = sprite_index;
            ID.image_index = image_index;
            ID.imgSpd = image_speed / global.dt;
            ID.image_xscale = image_xscale;
            ID.dir = sign(xspeed);
            
        instance_destroy();
    }
    
    playSFX(sfxReflect);
}

