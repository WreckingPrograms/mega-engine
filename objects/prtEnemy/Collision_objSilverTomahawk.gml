if !reflectProjectiles && weaponDamage[Weapons.SILVER_TOMAHAWK] != 0
&& !(reflectProjectilesLeft  && spriteGetXCenterObject(other.id) < spriteGetXCenter())
&& !(reflectProjectilesRight  && spriteGetXCenterObject(other.id) > spriteGetXCenter())
{
    if !dead
    {
        if canHit 
        {
            healthpoints -= weaponDamage[Weapons.SILVER_TOMAHAWK];
            visible = false;
        }
        alarm[11] = 2;
        
        if healthpoints >= 0
            with other instance_destroy();
            
        audio_stop_sound(sfxBuster);
        playSFX(sfxEnemyHit);
            
        if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
        {
            instanceCreate(spriteGetXCenter(), spriteGetYCenter(), objItemExplosion);
        }
    }
}
else
{
    if !dead
        event_user(0); // Reflect the projectiles
}

