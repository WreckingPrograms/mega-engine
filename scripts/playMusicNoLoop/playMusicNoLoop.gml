// Plays music without looping it
// Example: playMusicNoLoop(mscBeta)
function playMusicNoLoop(musicAsset)
{
	if global.msc >= 0
		audio_stop_sound(global.msc);

	global.msc = audio_play_sound(musicAsset, 100, false);
}
