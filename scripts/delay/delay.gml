// Runs the callback function in a certain number of frames, with delta time accounted for
// Useful as an Alarm replacement when using delta time
// The callback function should not take arguments and should not return anything
function delay(frames, callback, countWhenPaused=false)
{
	array_push(global.delayedCalls, { inst: id, frames: frames, callback: callback, countWhenPaused: countWhenPaused });
}