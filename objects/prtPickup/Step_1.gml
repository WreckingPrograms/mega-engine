// Destroy the pickup if it's already been collected on a previous life
// However, if it's been dropped by an enemy, this can be ignored
if timeBeforeDestroy == 0
{    
	pickupKey = string(x) + "," + string(y);
    if variable_struct_exists(global.collectedPickups, pickupKey)
        instance_destroy();
}

