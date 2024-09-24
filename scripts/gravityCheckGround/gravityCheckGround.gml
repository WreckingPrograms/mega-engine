// Applies gravity only if we are not on the ground
// Make sure to specify the variable 'ground' in the object [if necessary, use checkGround()]
function gravityCheckGround(grav=undefined, maxSpeed=undefined)
{
	if !ground
	{
	    yspeed += (grav ?? 0.25) * global.dt;
		maxSpeed = maxSpeed ?? 7;
	    if yspeed > maxSpeed
	        yspeed = maxSpeed;
	}
}
