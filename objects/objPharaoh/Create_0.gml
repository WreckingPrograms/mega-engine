event_inherited();

pose = sprPharaohPose;
poseImgSpeed = 3/60;
contactDamage = 4;

global.weaponID = 3; //The weapon ID in the pause screen; can be found in objGlobalControl's Create event
global.bossID = 7; //The ID on the stage select screen. The top-left has an ID of 0, then it goes clockwise (so the left panel's ID is 7)
            //The middle panel's ID is 8

ground = false;
attackTimer = 0;
jumpTimer = 0;
jumpAmount = 0;
canInitShoot = true;
phase = 0; //0 = nothing; 1 = jumping; 2 = jumping and shooting; 3 = shooting the big shot


//For the Weapon Get screen
global.bossWeapon = pharaohshot;
global.bossWeaponName = "PHARAOH SHOT";
global.bossWeaponPrimary = make_color_rgb(248, 120, 88); //The primary color for the giant MM in the weapon get screen
global.bossWeaponPrimaryDark = make_color_rgb(255, 55, 26); //The shading on the primary color
global.bossWeaponSecondary = make_color_rgb(240, 208, 176); //The secondary color for the giant MM in the weapon get screen



damageBuster = 1;
damageBusterCharged = 3;

damageMetalBlade = 1;

damagePharaohShot = 1;
damagePharaohShotCharged = 3;

damageStarCrash = 0;

damageSilverTomahawk = 2;
damageWindStorm = 5;

