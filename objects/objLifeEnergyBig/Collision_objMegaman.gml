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

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

