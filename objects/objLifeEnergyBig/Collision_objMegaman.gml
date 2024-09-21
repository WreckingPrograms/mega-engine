instance_destroy();

if global._health < 28
{
    global.frozen = true;
    with objHealthWeaponBar
    {
        increaseHealth = true;
        increaseHealthAmount = other.hlth;
    }
    
    audio_stop_sound(sfxEnergyRestore);
    playSFX(sfxEnergyRestore, true);
}

if pickupKey != ""
{
    global.collectedPickups[$ pickupKey] = true;
}

