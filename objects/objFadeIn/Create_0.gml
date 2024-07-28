//NOTE: This is the fade in object that gets created at the start of every level
//That means it deactivates all objects except itself and objGlobalControl, and only activates objPlayer and objHealthWeaponBar after a while
//Please use objFadeInNoDeactivation if you do not want this behaviour

blackAlpha = 1;
blackAlphaDecrease = 0.2;
blackAlphaTimer = 0;
blackAlphaTimerMax = 3;

alarm[0] = 1;
canAlarm = true;

