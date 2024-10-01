// More stable moving platform code!

// Not rewriting this now. Collision rewrite pending

event_inherited();

if !isFrozen() && !dead
{
	if xspeed != 0 || yspeed != 0
		move(xspeed * global.dt, yspeed * global.dt);
}