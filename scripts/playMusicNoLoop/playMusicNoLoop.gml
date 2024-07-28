/// @function playMusicNoLoop
/// @param sound
/// @description Plays music without looping it
function playMusicNoLoop(musicAsset)
{
	//Example: playMusicNoLoop(mscBeta)

	if global.msc >= 0
		audio_stop_sound(global.msc);

	global.msc = audio_play_sound(musicAsset, 100, false);
}
