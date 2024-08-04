// Play a sound effect
function playSFX(sound, loop=false)
{
	audio_stop_sound(sound);
	audio_play_sound(sound, 10, loop);
}
