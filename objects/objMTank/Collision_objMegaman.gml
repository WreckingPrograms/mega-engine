instance_destroy();

if global.mTanks < 1
    global.mTanks += 1;
    
playSFX(sfxImportantItem);

if pickupKey != ""
{
    global.collectedPickups[$ pickupKey] = true;
}

