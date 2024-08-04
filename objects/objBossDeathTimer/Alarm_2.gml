var ID;
ID = instanceCreate(x, y, objFadeout);
    ID.type = "room";
    
if !global.weaponUnlocked[global.weaponID]
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

