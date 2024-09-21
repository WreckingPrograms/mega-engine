// Plays music
// Example: playMusic(mscBeta)
function playMusic(musicAsset)
{
	if global.msc >= 0
		audio_stop_sound(global.msc);

	global.msc = audio_play_sound(musicAsset, 100, true);
}
