if closing 
{
    image_speed = openImgSpeed * global.dt;
    if floor(image_index) == 8
    {
        image_index = 8;
        
        if dir == -1
        {
            mySolid = instanceCreate(x + 16, y, objSolid);
                mySolid.image_yscale = 4;
        }
        else
        {
            mySolid = instanceCreate(x, y, objSolid);
                mySolid.image_yscale = 4;
        }
            
        with objSectionSwitcher
        {
            global.frozen = false;
            objMegaman.visible = true;
            instance_destroy();
            with objMegaman playerDeactivateObjects();
        }
        
        closing = false;
        image_speed = 0;
    }
}