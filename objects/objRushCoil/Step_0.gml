if !isFrozen()
{
    if sprite_index == sprRush || sprite_index == sprRushCoil
    {
        checkGround();
        gravityCheckGround();
        generalCollision();
    }
    else
    {
        yspeed = 0;
    }
    
    if sprite_index == sprRush
        image_speed = 7 / 60 * global.dt;
    
    if canCoil && instance_exists(objMegaman)
    {
        if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + 1 - (objMegaman.yspeed * global.dt), objMegaman, false, false) >= 0
        {
            if objMegaman.yspeed > 0 && objMegaman.bbox_bottom <= bbox_top + (objMegaman.yspeed * global.dt) + 1
				&& !objMegaman.climbing
            {
                objMegaman.yspeed = -7;
                objMegaman.canMinJump = false;
                sprite_index = sprRushCoil;
                canCoil = false;
                delay(60, teleportAway);
                
				playerConsumeAmmo(global.currentWeapon);
            }
        }
    }
    
    if collision_rectangle(x - 5, bbox_top, x + 5, bbox_bottom, objSolid, false, false) >= 0 && sprite_index == sprRush
    {
        teleportAway();
    }
    
    y += yspeed * global.dt;
}
else
{
    image_speed = 0;
}

