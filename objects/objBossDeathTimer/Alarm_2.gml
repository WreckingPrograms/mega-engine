var ID;
ID = instance_create(x, y, objFadeout);
    ID.type = "room";
    
if global.weaponUnlocked[global.weaponID] == false
{
    ID.myRoom = rmWeaponGet;
    global.passPlayVictory = false;
}
else
{
    ID.myRoom = rmPass;
    global.passPlayVictory = true;
}

global.passContinueRoom = room;

