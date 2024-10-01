event_inherited();

if !isFrozen() && !dead
{
	checkGround();
	gravityCheckGround();
	generalCollision();
}