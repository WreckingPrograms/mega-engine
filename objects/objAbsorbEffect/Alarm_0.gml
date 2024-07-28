if instance_exists(objBossDeathTimer)
{
    move_towards_point(sprite_get_xcenter_object(objBossDeathTimer), sprite_get_ycenter_object(objBossDeathTimer), spd);
}

