if reflectProjectiles == false && damageStarCrash != 0
&& !(reflectProjectilesLeft == true && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
&& !(reflectProjectilesRight == true && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
{
    if dead == false
    {
        if canHit == true
        {
            healthpoints -= damageStarCrash;
            visible = false;
        }
        alarm[11] = 2;
        with other instance_destroy();
        
        if other.xspeed == 0 //When it is not yet fired
        {
            global.ammo[global.currentWeapon] -= global.weaponAmmoContact[global.weaponSlot[global.currentWeapon]];
            if global.ammo[global.currentWeapon] <= 0
                global.ammo[global.currentWeapon] = 0;
        }
        
        playSFX(sfxEnemyHit);
        
        if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
        {
            instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objItemExplosion);
        }
    }
}
else
{
    if dead == false
        event_user(0); //Reflect the projectiles
}

