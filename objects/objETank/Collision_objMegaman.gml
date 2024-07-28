instance_destroy();

if global.eTanks < 9
    global.eTanks += 1;
    
playSFX(sfxImportantItem);

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

