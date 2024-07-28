if type == "restart"
{
    room_restart();
    global.weapon = megabuster;
}
else if type == "room"
{
    room_goto(myRoom);
    global.weapon = megabuster;
}

