instance_destroy();

if global.mTanks < 1
    global.mTanks += 1;
    
playSFX(sfxImportantItem);

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

