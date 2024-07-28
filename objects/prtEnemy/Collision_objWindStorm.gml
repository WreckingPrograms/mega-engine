if reflectProjectiles == false && damageWindStorm != 0
&& !(reflectProjectilesLeft == true && sprite_get_xcenter_object(other.id) < sprite_get_xcenter())
&& !(reflectProjectilesRight == true && sprite_get_xcenter_object(other.id) > sprite_get_xcenter())
{
    if dead == false
    {
        if canHit == true
        {
            healthpoints -= damageWindStorm;
            visible = false;
        }
        alarm[11] = 2;
        
        sound_stop(sfxBuster);
        playSFX(sfxEnemyHit);
        
        if healthpoints <= 0 && object_get_parent(object_index) != prtBoss
        {
            var windID;
            windID = instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objEnemyWindStorm);
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
    if dead == false
        event_user(0); //Reflect the projectiles
}

