if !global.frozen
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
        image_speed = 7/60;
    
    if canCoil 
    {
        if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + 1, objMegaman, false, false) >= 0
        {
            if objMegaman.yspeed > 0 && objMegaman.bbox_bottom <= bbox_top+objMegaman.yspeed
            && !objMegaman.climbing
            {
                objMegaman.yspeed = -7;
                objMegaman.canMinJump = false;
                sprite_index = sprRushCoil;
                canCoil = false;
                alarm[0] = 60;
                
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
            }
        }
    }
    
    if collision_rectangle(x-5, bbox_top, x+5, bbox_bottom, objSolid, false, false) >= 0 && sprite_index == sprRush
    {
        event_perform(ev_alarm, 0);
    }
    
    y += yspeed;
}
else
{
    image_speed = 0;
    if alarm[0] != -1
        alarm[0] += 1;
}

