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

if pickupKey != ""
{
    global.collectedPickups[$ pickupKey] = true;
}

