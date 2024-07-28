/// @function playerPause
/// @description Pauses the game when the pause button is pressed
function playerPause() {

	if global.keyPausePressed && canPause == true
	{
	    global.frozen = true;
	    instance_create(x, y, objPauseMenu);
	    playSFX(sfxPause);
	}


}
