//Creation code:
//startup = <number> (the amount of frames it takes for the Yoku Block to first appear)
//active = <number> (the amount of frames the Yoku Block is active before disappearing)
//wait = <number> (the amount of frames the Yoku Block needs to reappear after disappearing
//All creation code variables are mendatory; not adding them to the creation code will give you an error

//Note: Yoku Blocks appear and disappear regardless of whether they are on-screen or off-screen
//This is to prevent inconsistent timing, such as the ones in Heat Man's stage in MM2

event_inherited();

neverDespawn = true;
    
timer = 0;
phase = 0; //0 = waiting to appear; 1 = active; 2 = waiting to reappear after disappearing
sprite_index = sprYokuBlock;
mySolid = -12;

