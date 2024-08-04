if type == "restart"
{
    room_restart();
    global.weapon = Weapons.MEGA_BUSTER;
}
else if type == "room"
{
    room_goto(myRoom);
    global.weapon = Weapons.MEGA_BUSTER;
}

