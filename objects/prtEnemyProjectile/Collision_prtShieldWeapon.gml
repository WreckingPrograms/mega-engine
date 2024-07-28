with other instance_destroy();
instance_destroy();

if other.xspeed == 0 //When it is not yet fired
{
    global.ammo[global.currentWeapon] -= global.weaponAmmoContact[global.weaponSlot[global.currentWeapon]];
    if global.ammo[global.currentWeapon] <= 0
        global.ammo[global.currentWeapon] = 0;
}

