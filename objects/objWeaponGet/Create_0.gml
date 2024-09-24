timer = 0; // The timer has multiple uses
subTimer = 0;
megaX = round(room_width / 2);
megaY = room_height + 40;
megaSpr = sprMegamanWeaponGetTeleport;
megaImg = 0;

text1Alpha = 0;
text2Alpha = 0;

global.checkpoint = false;

global.weaponUnlocked[global.weaponID] = true; // Unlocks the special weapon of the RM
global.bossDefeated[global.bossID] = true; // For the stage select screen

phase = 0; // 0 = preparing for moving up; 1 = moving up; 2 = de-teleporting; 3 = waiting; 4 = moving right; 5 = waiting for text;
           // 6 = show "You got"; 7 = show weapon name; 8 = flicker between normal and weapon colors; 9 = weapon colors and timer for leaving

