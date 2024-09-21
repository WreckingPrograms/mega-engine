// Stops the firing sound of a weapon, typically called when an enemy is hit
function stopWeaponSound(obj)
{
	switch (obj)
	{
		case objBusterShot:
		case objSilverTomahawk:
		case objWindStorm:
			audio_stop_sound(sfxBuster);
			break;
			
		case objBusterShotHalfCharged: audio_stop_sound(sfxBusterHalfCharged); break;
		case objBusterShotCharged: audio_stop_sound(sfxBusterCharged); break;
		case objMetalBlade: audio_stop_sound(sfxMetalBlade); break;
		case objPharaohShot: audio_stop_sound(sfxPharaohShot); break;
		case objPharaohShotCharged: audio_stop_sound(sfxPharaohShotCharged); break;
	}
}