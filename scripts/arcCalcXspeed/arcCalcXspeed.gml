// Finds the horizontal speed needed to reach a certain point in an arc
function arcCalcXspeed(tYspeed, tGrav, spawnX, spawnY, impactX, impactY)
{
	var tY = spawnY, tYprev = tY, time = 0;
	do 
	{
	    time++;
	    tYprev = tY;
	    tY += tYspeed;
	    tYspeed += tGrav;
		
		// Fall back to be sure to never end in an infinite loop
		if time > 600 && ((impactX - spawnX) / time) < 1
		{
			return 0;
		}
	}
	until (tY >= impactY && tYprev < impactY && tGrav >= 0) || (tYspeed > 0 && tY > impactY && tGrav >= 0)
		|| (tY <= impactY && tYprev > impactY && tGrav < 0) || (tYspeed < 0 && tY < impactY && tGrav < 0);

	return (impactX - spawnX) / time;
}
