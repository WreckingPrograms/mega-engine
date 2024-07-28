if reflectProjectiles == false && damageSilverTomahawk != 0
&& !(reflectProjectilesLeft == true && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
&& !(reflectProjectilesRight == true && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
{
    if dead == false
    {
        if canHit == true
        {
            healthpoints -= damageSilverTomahawk;
            visible = false;
        }
        alarm[11] = 2;
        
        if healthpoints >= 0
            with other instance_destroy();
            
        sound_stop(sfxBuster);
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

