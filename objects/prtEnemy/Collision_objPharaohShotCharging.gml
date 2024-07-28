if reflectProjectiles == false && damagePharaohShot != 0
&& !(reflectProjectilesLeft == true && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
&& !(reflectProjectilesRight == true && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
{
    if dead == false
    {
        if other.sprite_index == sprPharaohShotCharging
        {
            if canHit == true
            {
                healthpoints -= damagePharaohShot;
                visible = false;
            }
            alarm[11] = 2;
            
            if healthpoints >= 0
                with other instance_destroy();
                
            playSFX(sfxEnemyHit);
                
            if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
            {
                instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objItemExplosion);
            }
            
            //No ammo was taken in MM4, so I removed it from here as well
            //global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
        }
        else
        {
            if canHit == true
            {
                healthpoints -= damagePharaohShotCharged;
                visible = false;
            }
            alarm[11] = 2;
            
            if healthpoints >= 0
                with other instance_destroy();
                
            playSFX(sfxEnemyHit);
                
            if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
            {
                instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objExplosion);
            }
            
            //global.ammo[global.currentWeapon] -= 2;
        }
    }
}
else
{
    if dead == false
        event_user(0); //Reflect the projectiles
}

