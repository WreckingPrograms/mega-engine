if instance_exists(objMegaman)
{
    x = objMegaman.x;
    y = objMegaman.y;
}

if increaseHealth 
{
    if increaseHealthAmount > 0 && global._health < 28
    {
        increaseTimer += 1;
        if increaseTimer >= 3
        {
            global._health += 1;
            increaseHealthAmount -= 1;
            increaseTimer = 0;
        }
    }
    else
    {
        increaseHealth = false;
        if global._health > 28
            global._health = 28;
        global.frozen = false;
        increaseTimer = 0;
        audio_stop_sound(sfxEnergyRestore);
    }
}
else if increaseAmmo 
{
    if increaseAmmoAmount > 0 && global.ammo[global.currentWeapon] < 28
    {
        increaseTimer += 1;
        if increaseTimer >= 3
        {
            global.ammo[global.currentWeapon] += 1;
            increaseAmmoAmount -= 1;
            increaseTimer = 0;
        }
    }
    else
    {
        increaseAmmo = false;
        if global.ammo[global.currentWeapon] > 28
            global.ammo[global.currentWeapon] = 28;
        global.frozen = false;
        increaseTimer = 0;
        audio_stop_sound(sfxEnergyRestore);
    }
}

