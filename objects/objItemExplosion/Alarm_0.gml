instance_destroy();

//Random drop rates (credit to Blyka)
randomize();

var randitem;
randitem = floor(random(400));

if (randitem < 4) 
{
    //var nitem;
    //nitem = instance_create(x-8,y-8,objLife);
    //nitem.alarm[0] = 105 * 2;
}
else if (randitem < 45) 
{
    var nitem, item;
    randomize();
    item = choose(objLifeEnergyBig, objWeaponEnergyBig);
    randomize();
    nitem = instance_create(x-8,y-8,item);
    nitem.alarm[0] = 105 * 2;
}
else if (randitem < 100) 
{
    var nitem, item;
    randomize();
    item = choose(objLifeEnergySmall, objWeaponEnergySmall);
    randomize();
    nitem = instance_create(x-8,y-8,item);
    nitem.alarm[0] = 105 * 2;
}

