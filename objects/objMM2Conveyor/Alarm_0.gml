//The player could clip through the right side of the conveyor belt when moving left and when the coneveyor belt's direction was also left
//This code fixes that
if dir == -1
{
    with instance_create(x+size*16-15, y, objSolid)
        visible = false;
}

image_xscale = size;

