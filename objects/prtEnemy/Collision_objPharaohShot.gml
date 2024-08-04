if !reflectProjectiles && weaponDamage[Weapons.PHARAOH_SHOT] != 0
&& !(reflectProjectilesLeft  && spriteGetXCenterObject(other.id) < spriteGetXCenter())
&& !(reflectProjectilesRight  && spriteGetXCenterObject(other.id) > spriteGetXCenter())
{
    if !dead
    {
        if canHit 
        {
            healthpoints -= weaponDamage[Weapons.PHARAOH_SHOT];
            visible = false;
        }
        alarm[11] = 2;
        with other instance_destroy();
        
        audio_stop_sound(sfxPharaohShot);
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

