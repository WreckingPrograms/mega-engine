instance_destroy();

if global.ammo[global.currentWeapon] < 28
{
    global.frozen = true;
    with objHealthWeaponBar
    {
        increaseAmmo = true;
        increaseAmmoAmount = other.hlth;
    }
    
    audio_stop_sound(sfxEnergyRestore);
    playSFX(sfxEnergyRestore, true);
}

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

