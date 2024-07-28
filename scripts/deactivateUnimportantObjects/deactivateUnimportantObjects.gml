/// @function deactivateUnimportantObjects
/// @description Deactivates umimportant objects. Even deactivates objects inside the section
function deactivateUnimportantObjects() {

	instance_deactivate_all(true);

	//Add more important objects as they are added
	instance_activate_object(objMegaman);
	instance_activate_object(objGlobalControl);
	instance_activate_object(objHealthWeaponBar);

	instance_activate_object(objBossDoor);


	//Objects that should remain activated, but without animation (disabled animation code is in the object itself)
	instance_activate_object(objMM2Conveyor);


	//Objects that destroy themselves off screen
	//Though, when switching sections they should not be visible
	if !instance_exists(objSectionSwitcher)
	{
	    instance_activate_object(prtPlayerProjectile);
	    instance_activate_object(prtEnemyProjectile);
	    instance_activate_object(objReflectedProjectile);
	    instance_activate_object(prtEffect);
	    instance_activate_object(prtRush);
	    instance_activate_object(objRushJet); //Could not be parented to prtRush since it's parented to prtMovingPlatformSolid
	    instance_activate_object(prtPickup);
    
	    //Objects that have different code off-screen
	    instance_activate_object(prtEnemy);
	    instance_activate_object(prtGimmick);
	    instance_activate_object(objBossControl);
	}


}
