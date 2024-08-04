if !reflectProjectiles && weaponDamage[Weapons.STAR_CRASH] != 0
&& !(reflectProjectilesLeft  && spriteGetXCenterObject(other.id) < spriteGetXCenter())
&& !(reflectProjectilesRight  && spriteGetXCenterObject(other.id) > spriteGetXCenter())
{
    if !dead
    {
        if canHit 
        {
            healthpoints -= weaponDamage[Weapons.STAR_CRASH];
            visible = false;
        }
        alarm[11] = 2;
        with other instance_destroy();
        
        if other.xspeed == 0 // When it is not yet fired
        {
            global.ammo[global.currentWeapon] -= global.weaponAmmoContact[global.weaponSlot[global.currentWeapon]];
            if global.ammo[global.currentWeapon] <= 0
                global.ammo[global.currentWeapon] = 0;
        }
        
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

