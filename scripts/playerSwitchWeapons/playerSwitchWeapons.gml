// Allows for quick weapon switching
// If you do not want quick weapon switching in your game, simply remove the script from objMegaman's step event
function playerSwitchWeapons()
{
	var changedWeapon = false;

	// Switching to the left
	if global.keyWeaponSwitchLeftPressed
	{    
	    do
	    {
	        global.currentWeapon -= 1;
	        if global.currentWeapon < 0
	            global.currentWeapon = global.totalWeapons;
	    }
		until global.weaponUnlocked[global.currentWeapon];
		
		changedWeapon = true;
	}

	// Switching to the right
	if global.keyWeaponSwitchRightPressed
	{
		do
	    {
	        global.currentWeapon += 1;
	        if global.currentWeapon > global.totalWeapons
	            global.currentWeapon = 0;
	    }
		until global.weaponUnlocked[global.currentWeapon];
    
	    changedWeapon = true;
	}

	// Holding the left and right weapon switch keys at the same time results in the Mega Buster being selected
	if global.keyWeaponSwitchLeft && global.keyWeaponSwitchRight && global.weapon != Weapons.MEGA_BUSTER
	{
	    global.currentWeapon = 0;
	    changedWeapon = true;
	}
	
	if changedWeapon
	{
		drawWeaponIcon = true;
	    drawWeaponIconTimer = 30;
    
	    global.weapon = global.weaponSlot[global.currentWeapon];
	    event_user(0); // Colors
    
	    with prtPlayerProjectile instance_destroy();
	    with objReflectedProjectile instance_destroy();
	    with prtRush instance_destroy();
	    with objRushJet instance_destroy();
    
	    if onRushJet 
	    {
	        onRushJet = false;
	        canMove = true;
	    }
    
	    playSFX(sfxWeaponSwitch);
    
	    audio_stop_sound(sfxCharging);
	    audio_stop_sound(sfxCharged);
	}

	// Timer
	if drawWeaponIconTimer != -1
	{
	    drawWeaponIconTimer -= 1;
	    if drawWeaponIconTimer == 0
	    {
	        drawWeaponIcon = false;
	    }
	}
}
