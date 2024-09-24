blackAlphaTimer += 1 * global.dt;

if blackAlphaTimer >= blackAlphaTimerMax
{
    blackAlpha += blackAlphaDecrease;
    blackAlphaTimer -= blackAlphaTimerMax;
}

if blackAlpha >= 1 && canAlarm 
{
    delay(10, function() {
	
		if type == "restart"
		{
		    room_restart();
		    global.weapon = Weapons.MEGA_BUSTER;
		}
		else if type == "room"
		{
		    room_goto(myRoom);
		    global.weapon = Weapons.MEGA_BUSTER;
		}

	});
	
    canAlarm = false;
}

