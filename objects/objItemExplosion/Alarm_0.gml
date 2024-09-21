instance_destroy();

// Random drop rates (credit to Blyka)
var randitem = floor(random(400));

if (randitem < 4) 
{
	// Uncomment this if you want enemies to drop extra lives
    // var nitem = instanceCreate(x - 8, y - 8, objLife);
    // nitem.alarm[0] = 105 * 2;
}
else if (randitem < 45) 
{
    var item = choose(objLifeEnergyBig, objWeaponEnergyBig);
    var nitem = instanceCreate(x - 8, y - 8, item);
    nitem.alarm[0] = 105 * 2;
}
else if (randitem < 100) 
{
    var item = choose(objLifeEnergySmall, objWeaponEnergySmall);
    var nitem = instanceCreate(x - 8, y - 8, item);
    nitem.alarm[0] = 105 * 2;
}

