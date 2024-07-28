/// @function checkGround
/// @description Checks whether or not the object is on the ground
function checkGround() {

	if place_meeting(x, y+1, objSolid) || (place_meeting(x, y+1, objTopSolid))
	|| place_meeting(x, y+1, prtMovingPlatformSolid) || (place_meeting(x, y+1, prtMovingPlatformJumpthrough))
	{
	    if place_meeting(x, y+1, objSolid)
	        ground = true;
	    else if place_meeting(x, y+1, objTopSolid)
	    {
	        if bbox_bottom < instance_place(x, y+1, objTopSolid).bbox_top
	            ground = true;
	        else
	            ground = false;
	    }
	    else if place_meeting(x, y+1, prtMovingPlatformSolid)
	    {
	        var sld;
	        sld = instance_place(x, y+1, prtMovingPlatformSolid);
	        if sld.object_index != objRushJet
	            ground = true;
	        else
	            ground = false;
	    }
	    else
	    {
	        var sld;
	        sld = instance_place(x, y+1, prtMovingPlatformJumpthrough);
	        if sld.object_index != objRushJet
	        {
	            if bbox_bottom < sld.bbox_top
	                ground = true;
	            else
	                ground = false;
	        }
	        else
	            ground = false;
	    }
	}
	else
	    ground = false;


}
