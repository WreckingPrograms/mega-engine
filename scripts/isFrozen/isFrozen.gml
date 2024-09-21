// Returns whether or not this object is frozen in place
// Making this its own function allows you to add other conditions (e.g. Time Stopper, where only enemies are frozen)
function isFrozen()
{
	return global.frozen;
}