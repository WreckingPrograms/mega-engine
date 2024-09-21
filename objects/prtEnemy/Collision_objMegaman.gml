if !dead
{
	var damage = contactDamage;
	with other
	{
		if canHit
			playerGetHit(damage);
	}
}

