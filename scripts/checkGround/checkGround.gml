// Checks whether or not the object is on the ground
function checkGround()
{
	if place_meeting(x, y + 1, objSolid) || placeMeetingMovingPlatform(x, y + 1, prtMovingPlatformSolid)
	{
		ground = true;
		return;
	}
	
	var topSolid = instance_place(x, y + 1, objTopSolid);
	if topSolid >= 0 && bbox_bottom <= topSolid.bbox_top
	{
		ground = true;
		return;
	}
	
	var movingPlatformJumpthrough = instance_place(x, y + 1, prtMovingPlatformJumpthrough);
	if movingPlatformJumpthrough >= 0 && movingPlatformJumpthrough.object_index != objRushJet
		&& bbox_bottom <= movingPlatformJumpthrough.bbox_top
	{
		ground = true;
		return;
	}
	
	ground = false;
}
