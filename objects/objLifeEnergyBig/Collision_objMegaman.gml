instance_destroy();

if global._health < 28
{
    global.frozen = true;
    with objHealthWeaponBar
    {
        increaseHealth = true;
        increaseHealthAmount = other.hlth;
    }
    
    sound_stop(sfxEnergyRestore);
    sound_loop(sfxEnergyRestore);
}

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

