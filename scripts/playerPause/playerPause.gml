// / @function playerPause
// / @description Pauses the game when the pause button is pressed
function playerPause() {

	if global.keyPausePressed && canPause 
	{
	    global.frozen = true;
	    instanceCreate(x, y, objPauseMenu);
	    playSFX(sfxPause);
	}


}
