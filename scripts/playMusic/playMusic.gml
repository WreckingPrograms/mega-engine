/// @function playMusic
/// @param filename
/// @description Plays music
function playMusic(musicAsset)
{
	//Example: playMusic(mscBeta)

	if global.msc >= 0
		audio_stop_sound(global.msc);

	global.msc = audio_play_sound(musicAsset, 100, true);
}
