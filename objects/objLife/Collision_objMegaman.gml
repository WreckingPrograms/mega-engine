instance_destroy();

if global._lives < 9
    global._lives += 1;
    
playSFX(sfxImportantItem);

if pickupID != -15
{
    global.pickupCollected[pickupID] = true;
}

