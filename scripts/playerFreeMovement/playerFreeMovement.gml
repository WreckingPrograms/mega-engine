/// @function playerFreeMovement
/// @description Frees the player's movement (e.g. after being locked)
function playerFreeMovement() {

	with objMegaman
	{
	    canMove = true;
	    canSpriteChange = true;
	    canPause = true;
	    mask_index = mskMegaman;
	}


}
