option = 0;
selectedOption = false;
global.checkpoint = false;
global.levelStart = true;

if global._lives < 0
{
    global._lives = 2;
    gameOver = true;
    canSelectOption = false;
    playMusicNoLoopVolume(mscGameOver, 1);
    delay(240, function() {
	
		canSelectOption = true;
		playMusicVolume(mscPassScreen, 1);

	});
}
else
{
    gameOver = false;
    canSelectOption = true;
    
    if global.passPlayVictory 
        playMusicVolume(mscWeaponGet, 1);
}
    
for (var i = 0; i <= global.totalWeapons; i += 1)
{
    global.ammo[i] = 28;
}

