//Handles the boss's death
//Also transforms into the Mega Man that automatically moves to the center of the screen
alarm[0] = 240;

xspeed = 0;
yspeed = 0;
isMM = false;
ground = true;
prevGround = ground;
canInitJump = true;
absorbing = false;
absorbAmount = 0;
startTeleportTimer = 0;
teleporting = false;
teleportTimer = 0;
teleportY = 0;

with objMegaman canPause = false;

