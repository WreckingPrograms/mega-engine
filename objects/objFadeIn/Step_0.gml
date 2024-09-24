blackAlphaTimer += 1 * global.dt;

if blackAlphaTimer >= blackAlphaTimerMax
{
    blackAlpha -= blackAlphaDecrease;
    blackAlphaTimer -= blackAlphaTimerMax;
}

if blackAlpha <= 0 && canAlarm 
{
    delay(4, function() {
	
		instance_destroy();

		instance_activate_object(objMegaman);
		instance_activate_object(objHealthWeaponBar);
		instance_activate_object(objBossDoor);

	});
	
    canAlarm = false;
}

