// Assigns depth values to objects, which are used when creating instances of them with instanceCreate.
// See that script for more info.
// If an object isn't assigned a depth here, 0 is used by default.

global.objectDepths = {
	objGlobalControl: -1000,
	objBossControl: -100,
	objFadeIn: -10000,
	objFadeInNoDeactivation: -10000,
	objFadeout: -10000,
	objHealthWeaponBar: -100,
	
	objPassMenu: -1000,
	objPauseMenu: -1000,

	objCheckpoint: -100,
	objSectionBorderLeftScreen: -100,
	objSectionBorderRightScreen: -100,
	objSectionBorderTopScreen: -100,
	objSectionBorderBottomScreen: -100,
	objSectionBorderLeft: -100,
	objSectionBorderRight: -100,
	objSectionBorderTop: -100,
	objSectionBorderBottom: -100,
	objSectionArrowLeft: -100,
	objSectionArrowRight: -100,
	objSectionArrowUp: -100,
	objSectionArrowDown: -100,
	
	objMegaman: -2,
	
	objBusterShot: -1,
	objBusterShotCharged: -1,
	objBusterShotHalfCharged: -1,
	objSilverTomahawk: -1,
	objWindStorm: -1,
	objPharaohShotCharging: -2,
	objPharaohShot: -1,
	objPharaohShotCharged: -1,
	objMetalBlade: -1,
	objStarCrash: -3,
	objRushJet: -3,
	
	objReflectedProjectile: -1,
	
	objBossDoor: 10,
	objYokuBlock: 1,
};