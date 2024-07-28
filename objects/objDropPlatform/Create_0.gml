event_inherited();

respawn = true;

image_speed = 0;
image_index = 0;
canDrop = true;
phase = 0; //0 = idle; 1 = preparing to drop down; 2 = dropping down animation; 3 = dropped down; 4 = rebuilding animation
timer = 0;
dropTimerMax = 15;
rebuildTimerMax = 10;

topSolidID = instance_create(x-16, y, objTopSolid);
    topSolidID.image_xscale = 2;

