instance_destroy();

if global.eTanks < 9
    global.eTanks += 1;
    
playSFX(sfxImportantItem);

if pickupKey != ""
{
    global.collectedPickups[$ pickupKey] = true;
}

