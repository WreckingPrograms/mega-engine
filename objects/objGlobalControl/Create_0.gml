if room != rmInit
	initCamera();

// Keys
leftKey = vk_left;
rightKey = vk_right;
upKey = vk_up;
downKey = vk_down;
jumpKey = ord("Z");
shootKey = ord("X");
slideKey = ord("C");
pauseKey = vk_space;
weaponSwitchLeftKey = ord("A");
weaponSwitchRightKey = ord("S");

event_perform(ev_step_begin, 0); // Registers the key inputs


// Variables
global._health = 28;
global.weapon = 0;  // Can have values from the Weapons enum, even those that are not on the pause menu
global.currentWeapon = 0;   // Only the weapons used in the level; only those that are on the pause menu
global.frozen = false;



// Go to the next room if this is the initializing room
// Also, initialize some variables
if room == rmInit
{
	alarm[0] = 3; //  A few frames of leniency, so that if you have a bunch of initialization code, you get a black screen rather than waiting for the application to open
}


// When the level starts, all pickups should spawn
else if global.levelStart 
{
    event_user(0);
	global.levelStart = false;
}

