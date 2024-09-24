if room == rmInit
	exit;

// Register input
global.keyLeft = keyboard_check(leftKey);
global.keyRight = keyboard_check(rightKey);
global.keyUp = keyboard_check(upKey);
global.keyDown = keyboard_check(downKey);
global.keyJump = keyboard_check(jumpKey);
global.keyShoot = keyboard_check(shootKey);
global.keySlide = keyboard_check(slideKey);
global.keyPause = keyboard_check(pauseKey);
global.keyWeaponSwitchLeft = keyboard_check(weaponSwitchLeftKey);
global.keyWeaponSwitchRight = keyboard_check(weaponSwitchRightKey);

global.keyLeftPressed = keyboard_check_pressed(leftKey);
global.keyRightPressed = keyboard_check_pressed(rightKey);
global.keyUpPressed = keyboard_check_pressed(upKey);
global.keyDownPressed = keyboard_check_pressed(downKey);
global.keyJumpPressed = keyboard_check_pressed(jumpKey);
global.keyShootPressed = keyboard_check_pressed(shootKey);
global.keySlidePressed = keyboard_check_pressed(slideKey);
global.keyPausePressed = keyboard_check_pressed(pauseKey);
global.keyWeaponSwitchLeftPressed = keyboard_check_pressed(weaponSwitchLeftKey);
global.keyWeaponSwitchRightPressed = keyboard_check_pressed(weaponSwitchRightKey);

global.keyLeftReleased = keyboard_check_released(leftKey);
global.keyRightReleased = keyboard_check_released(rightKey);
global.keyUpReleased = keyboard_check_released(upKey);
global.keyDownReleased = keyboard_check_released(downKey);
global.keyJumpReleased = keyboard_check_released(jumpKey);
global.keyShootReleased = keyboard_check_released(shootKey);
global.keySlideReleased = keyboard_check_released(slideKey);
global.keyPauseReleased = keyboard_check_released(pauseKey);
global.keyWeaponSwitchLeftReleased = keyboard_check_released(weaponSwitchLeftKey);
global.keyWeaponSwitchRightReleased = keyboard_check_released(weaponSwitchRightKey);


// Handle delta time; making the game run at the same speed regardless of FPS
// For more info, see the Alarm 0 event
if global.enableDeltaTime
{
	// global.dt represents the speed up/down compared to 60 FPS. In other words, when the game runs at 60 FPS,
	// global.dt is 1. When the game runs at 120 FPS, globa.dt is 0.5, etc.
	// This allows you to code the game as if it ran at 60 FPS (which makes values from the official games work as normal),
	// and simply multiply timers, movements and accelerations by this value
	global.dt = delta_time / 1000000 * 60;
	global.dt = min(global.dt, 10); // Capped, so that when the game freezes for a long time, it doesn't jump ahead several seconds
}
else
{
	global.dt = 1;
}


// Handle delayed function calls
for (var i = 0, len = array_length(global.delayedCalls); i < len; i++)
{
	var entry = global.delayedCalls[i];
	if entry.countWhenPaused || !isFrozen()
	{
		entry.frames -= global.dt;
		if entry.frames <= 0
		{
			if instance_exists(entry.inst)
			{
				with entry.inst
					entry.callback();
			}
		
			array_delete(global.delayedCalls, i, 1);
			i--;
			len--;
		}
	}
}