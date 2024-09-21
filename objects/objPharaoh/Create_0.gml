event_inherited();

pose = sprPharaohPose;
poseImgSpeed = 3 / 60;
contactDamage = 4;

global.weaponID = 3; // The weapon ID in the pause screen; can be found in objGlobalControl's Create event
global.bossID = 3; // The ID on the stage select screen. See objStageSelect's Create event for more info

ground = false;
attackTimer = 0;
jumpTimer = 0;
jumpAmount = 0;
canInitShoot = true;
phase = 0; // 0 = nothing; 1 = jumping; 2 = jumping and shooting; 3 = shooting the big shot


// For the Weapon Get screen
global.bossWeaponName = "PHARAOH SHOT";
global.bossWeaponPrimary = make_color_rgb(248, 120, 88); // The primary color for the giant MM in the weapon get screen
global.bossWeaponPrimaryDark = make_color_rgb(255, 55, 26); // The shading on the primary color
global.bossWeaponSecondary = make_color_rgb(240, 208, 176); // The secondary color for the giant MM in the weapon get screen



weaponDamage[Weapons.MEGA_BUSTER] = 1;
weaponDamageSpecial[Weapons.MEGA_BUSTER] = 3;

weaponDamage[Weapons.METAL_BLADE] = 1;

weaponDamage[Weapons.PHARAOH_SHOT] = 1;
weaponDamageSpecial[Weapons.PHARAOH_SHOT] = 3;

weaponDamage[Weapons.STAR_CRASH] = 0;

weaponDamage[Weapons.SILVER_TOMAHAWK] = 2;
weaponDamage[Weapons.WIND_STORM] = 5;

