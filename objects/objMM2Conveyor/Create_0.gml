//Creation code:
//dir = 1/-1 (1 = right (default), -1 = left; optional)
//size = 1/2/3/etc (the size of the conveyor belt, measured in blocks of 16x16 pixels; optional, default is 1)

event_inherited();

respawn = true;
neverDespawn = true;

dir = 1;
    
size = 1;
    
spd = 1; //The speed the player moves at when standing on the conveyor belt
image_speed = 0;

arrowImg = 4;
midImg = 0;
arrowTimer = 0;
midTimer = 0;

alarm[0] = 1;

