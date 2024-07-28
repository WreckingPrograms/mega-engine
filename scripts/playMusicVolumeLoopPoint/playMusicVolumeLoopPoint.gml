/// @function playMusic
/// @param filename
/// @param  volume
/// @param  loop start
/// @param  loop end
/// @description Plays music and loops from one point to another point
///				 Loop start and loop end should be between 0 and 1 (0 being 0:00 and 1 being the end of the music)
function playMusicVolumeLoopPoint(musicAsset, volume, startPoint, endPoint)
{
	//Example: playMusicVolumeLoopPoint(mscBeta, 0.6, 0.4, 0.8)

	if global.msc >= 0
		audio_stop_sound(global.msc);

	global.msc = audio_play_sound(musicAsset, 100, true, volume);
	audio_sound_loop_start(global.msc, startPoint * audio_sound_length(global.msc));
	audio_sound_loop_end(global.msc, endPoint * audio_sound_length(global.msc));
}
