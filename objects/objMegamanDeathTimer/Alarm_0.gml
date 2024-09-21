global._lives -= 1;
global.lastRoom = room;

var ID = instanceCreate(x, y, objFadeout);
if global._lives >= 0
{
    ID.type = "restart";
}
else
{
    ID.type = "room";
    ID.myRoom = rmPass;
    global.passPlayVictory = false;
    global.passContinueRoom = room;
}
    
instance_destroy();

