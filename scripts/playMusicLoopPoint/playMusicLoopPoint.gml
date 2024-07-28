/// @function playMusic
/// @param filename
/// @param  loop start
/// @param  loop end
/// @description Plays music and loops from one point to another point
function playMusicLoopPoint(musicAsset, startPoint, endPoint)
{
	//Example: playMusicLoopPoint(mscBeta, 0.4, 0.8)

	if global.msc >= 0
		audio_stop_sound(global.msc);

	global.msc = audio_play_sound(musicAsset, 100, true);
	audio_sound_loop_start(global.msc, startPoint * audio_sound_length(global.msc));
	audio_sound_loop_end(global.msc, endPoint * audio_sound_length(global.msc));
}
