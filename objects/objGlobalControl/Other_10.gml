// When starting a level, none of the pickups have been used yet; however, they can be picked up, and shouldn't respawn when the room restarts
// This code makes sure all pickups spawn normally
global.collectedPickups = {};