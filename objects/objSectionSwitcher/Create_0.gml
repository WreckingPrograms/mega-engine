door = false;

global.frozen = true;

with prtEnemy beenOutsideView = true;
with prtPlayerProjectile instance_destroy();

deactivateUnimportantObjects();

if instance_exists(objMegaman)
{
    // Basically copy the player's appearance, so that the object can return to its original behaviour when done switching sections
    with objMegaman visible = false;
    sprite_index = objMegaman.sprite_index;
    image_index = objMegaman.image_index;
    imgSpd = objMegaman.image_speed / global.dt;
    image_speed = imgSpd * global.dt;
    image_xscale = objMegaman.image_xscale;
    
    alarm[0] = 1;
}
else
{
    instance_destroy();
    global.frozen = false;
}


// Variables that can me modified to make switching sections faster/slower
screenSpeedHor = 4; // The speed that the screen will move at if travelling horizontally
playerSpeedHor = 0.4; // The speed that Mega Man will move at if travelling horizontally
screenSpeedVert = 4; // Same as above but if travelling vertically
playerSpeedVert = 0.4; // Same as above but if travelling vertically

playerSpeedHorDoor = 0.7; // The speed that Mega Man will move at if travelling horizontally through a door


// Variables that cannot be modified
climbTimer = 0;
canProgressDoor = false;
canStep = false;
canAnimate = false;
