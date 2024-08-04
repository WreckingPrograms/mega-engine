if !reflectProjectiles && weaponDamage[Weapons.PHARAOH_SHOT] != 0
&& !(reflectProjectilesLeft  && spriteGetXCenterObject(other.id) < spriteGetXCenter())
&& !(reflectProjectilesRight  && spriteGetXCenterObject(other.id) > spriteGetXCenter())
{
    if !dead
    {
        if other.sprite_index == sprPharaohShotCharging
        {
            if canHit 
            {
                healthpoints -= weaponDamage[Weapons.PHARAOH_SHOT];
                visible = false;
            }
            alarm[11] = 2;
            
            if healthpoints >= 0
                with other instance_destroy();
                
            playSFX(sfxEnemyHit);
                
            if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
            {
                instanceCreate(spriteGetXCenter(), spriteGetYCenter(), objItemExplosion);
            }
            
            // No ammo was taken in MM4, so I removed it from here as well
            // global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
        }
        else
        {
            if canHit 
            {
                healthpoints -= weaponDamageSpecial[Weapons.PHARAOH_SHOT];
                visible = false;
            }
            alarm[11] = 2;
            
            if healthpoints >= 0
                with other instance_destroy();
                
            playSFX(sfxEnemyHit);
                
            if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
            {
                instanceCreate(spriteGetXCenter(), spriteGetYCenter(), objExplosion);
            }
            
            // global.ammo[global.currentWeapon] -= 2;
        }
    }
}
else
{
    if !dead
        event_user(0); // Reflect the projectiles
}

