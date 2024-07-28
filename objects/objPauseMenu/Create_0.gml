blackAlpha = 0;
blackAlphaIncrease = 0.2;
blackAlphaTimer = 0;
blackAlphaTimerMax = 2;

phase = 0;  //0: increasing the black rectangle's alpha
option = global.currentWeapon;
oldWeapon = global.weapon;
resetWeapon = false; //Should we, after exiting the menu, reset our weapon to the weapon that was used before the pause menu was opened? 

with objMegaman event_user(0);

