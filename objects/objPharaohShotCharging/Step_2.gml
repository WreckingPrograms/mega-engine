// Set position to above the player's head
if instance_exists(objMegaman)
{
    x = objMegaman.x + objMegaman.image_xscale;
    y = objMegaman.y - 20;
}
else
{
    instance_destroy();
}

