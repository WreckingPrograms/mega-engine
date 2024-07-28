/// @function gravityCheckGround
/// @description Applies gravity only if we are not on the ground
////			 Make sure to specify the variable 'ground' in the object [if necessary, use checkGround()]
function gravityCheckGround() {

	if ground == false
	{
	    yspeed += 0.25;
	    if yspeed > 7
	        yspeed = 7;
	}


}
