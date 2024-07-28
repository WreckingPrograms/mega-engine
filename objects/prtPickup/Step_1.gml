//Sets the ID of this pickup, so that we can despawn it when the room starts if the pickup has already been collected in the level
//However, if it's been dropped by an enemy, this can be ignored
if !(alarm[0] != -1 || alarm[1] != -1)
{
    if pickupID == -15
    {
        pickupID = global.currentPickupID;
        global.currentPickupID += 1;
    }
    
    if global.pickupCollected[pickupID] == true
        instance_destroy();
}

