// Applies gravity no matter what
function gravityNoGround(grav=undefined, maxSpeed=undefined)
{
	yspeed += (grav ?? 0.25) * global.dt;
	maxSpeed = maxSpeed ?? 7;
	if yspeed > maxSpeed
	    yspeed = maxSpeed;
}
