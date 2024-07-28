instance_destroy();

if global.ammo[global.currentWeapon] < 28
{
    global.frozen = true;
    with objHealthWeaponBar
    {
        increaseAmmo = true;
        increaseAmmoAmount = other.hlth;
    }
    
    sound_stop(sfxEnergyRestore);
    sound_loop(sfxEnergyRestore);
}

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

