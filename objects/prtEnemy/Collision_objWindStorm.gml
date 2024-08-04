if !reflectProjectiles && weaponDamage[Weapons.WIND_STORM] != 0
&& !(reflectProjectilesLeft  && spriteGetXCenterObject(other.id) < spriteGetXCenter())
&& !(reflectProjectilesRight  && spriteGetXCenterObject(other.id) > spriteGetXCenter())
{
    if !dead
    {
        if canHit 
        {
            healthpoints -= weaponDamage[Weapons.WIND_STORM];
            visible = false;
        }
        alarm[11] = 2;
        
        audio_stop_sound(sfxBuster);
        playSFX(sfxEnemyHit);
        
        if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
        {
            var windID;
            windID = instanceCreate(spriteGetXCenter(), spriteGetYCenter(), objEnemyWindStorm);
                windID.enemySpr = sprite_index;
                windID.enemyImg = image_index;
                windID.enemyXScale = image_xscale;
                windID.enemyYScale = image_yscale;
                windID.enemyAngle = image_angle;
                windID.image_index = other.image_index;
                windID.image_speed = other.image_speed;
                windID.image_xscale = other.image_xscale;
                
            dead = false;
        }
        
        with other instance_destroy();
    }
}
else
{
    if !dead
        event_user(0); // Reflect the projectiles
}

