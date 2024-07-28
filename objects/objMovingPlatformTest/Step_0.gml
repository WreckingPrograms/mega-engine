event_inherited();

if keyboard_check(ord("D")) && !keyboard_check(ord("A"))
    xspeed = 2;
else if keyboard_check(ord("A")) && !keyboard_check(ord("D"))
    xspeed = -2;
else
    xspeed = 0;
    
if keyboard_check(ord("S")) && !keyboard_check(ord("W"))
    yspeed = 2;
else if keyboard_check(ord("W")) && !keyboard_check(ord("S"))
    yspeed = -2;
else
    yspeed = 0;

