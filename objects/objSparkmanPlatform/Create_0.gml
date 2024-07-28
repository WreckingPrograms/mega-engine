event_inherited();

respawn = true;

acc = 0.15; //The vertical acceleration
subY = 0; //Because moving in sub-pixels messed up collision, we need a value that keeps track of the sub-pixels, and only use real pixels for yspeed
subYspeed = 0;
maxSpeed = 3;
decendSpeed = 1;
phase = 0; //0 = not moving; 1 = moving up; 2 = moving down

