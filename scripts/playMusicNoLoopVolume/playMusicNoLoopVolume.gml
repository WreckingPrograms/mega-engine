/// @function playMusicNoLoopVolume
/// @param filename
/// @param  volume
/// @description Plays music with a set volume. Volume should be between 0 and 1.
function playMusicNoLoopVolume(musicAsset, volume)
{
	//Example: playMusicNoLoopVolume(mscBeta, 0.6)

	if global.msc >= 0
		audio_stop_sound(global.msc);

	global.msc = audio_play_sound(musicAsset, 100, false, volume);
}
