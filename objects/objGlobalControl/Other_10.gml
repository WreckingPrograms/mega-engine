// When starting a level, none of the pickups have been used yet; however, they can be picked up, and shouldn't respawn when the room restarts
// This code makes sure all pickups spawn normally
var totalPickups = instance_number(prtPickup);

for (var i = 0; i <= totalPickups; i += 1)
{
    global.pickupCollected[i] = false;
}

