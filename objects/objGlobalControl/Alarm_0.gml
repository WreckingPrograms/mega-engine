// Initialize the game
    
display_reset(0, true); // Enables V-sync
randomize();
    
room_goto_next();
global.eTanks = 0;
global.mTanks = 0;
global._lives = 2;

global.font = font_add_sprite(sprFont, ord("!"), true, 0);
global.MM3font = font_add_sprite(sprMM3Font, ord("!"), true, 0);

global.collectedPickups = {};
    
for (var i = 0; i <= 7; i += 1)
{
    global.bossDefeated[i] = false;
}
    
global.lastRoom = rmInit;
global.checkpoint = false;
global.checkpointX = 0;
global.checkpointY = 0;
global.levelStart = false;
global.msc = -1;
global.delayedCalls = [];
    
global.primaryCol = c_white;
global.secondaryCol = c_white;
global.outlineCol = c_black;

global.resolution = [256, 224]; //  [x, y]
    
    
// Gameplay options
global.enableCharge = true; // Can we charge the buster?
global.enableSlide = true; // Can we slide?

// Engine options

// Whether or not to make game speed independent of FPS. Entity speeds and timers will speed up or slow down depending
// on the frame rate, so that the game plays at (roughly) the same speed regardless of FPS.
// Enabling this will complicate code slightly. TL;DR: for timers, movements and accelerations, multiply values by global.dt.
// If enabled, you cannot use Game Maker's Alarms for timers, since they're tied to the frame rate!
// If you don't want to deal with any of this, set global.enableDeltaTime to false.
global.enableDeltaTime = true;
global.dt = 0; // Delta time. Don't change the value of this


// Whether or not to allow the game to use any resolution, and draw borders in areas not taken up by the game view.
// Enabling this allows you to use any resolution (i.e. widescreen support)
global.enableWindowBorders = true;


// Whether or not to render HUD elements on the window border. Doesn't do anything with window borders disabled
global.drawHudOnWindowBorders = true;


// Whether or not to only scale up the game in integer values in fullscreen. This makes it so pixels scale perfectly,
// but it may not let the game cover the whole screen in fullscreen
global.enablePixelPerfectWindowScaling = false;



// Window
global.windowScale = 3;
setWindowScale(global.windowScale);
	
	
// When window borders are enabled, the application surface (game screen) is rendered manually
if global.enableWindowBorders
	application_surface_draw_enable(false);

    
// Weapon inventory
global.totalWeapons = 7; // 8 weapons in total including the buster, but since 0 is also a valid weapon ID, the value becomes 7
    
for (i = 0; i <= global.totalWeapons; i += 1)
{
    global.ammo[i] = 28;
}
    
global.weaponSlot[0] = Weapons.MEGA_BUSTER;
global.weaponUnlocked[0] = true; // The Mega Buster is always unlocked
global.weaponSlot[1] = Weapons.SILVER_TOMAHAWK;
global.weaponUnlocked[1] = true; // Unlocked because there's no RM for it yet
global.weaponSlot[2] = Weapons.WIND_STORM;
global.weaponUnlocked[2] = true; // Unlocked because there's no RM for it yet
global.weaponSlot[3] = Weapons.PHARAOH_SHOT;
global.weaponUnlocked[3] = false;
global.weaponSlot[4] = Weapons.METAL_BLADE;
global.weaponUnlocked[4] = true; // Unlocked because there's no RM for it yet
global.weaponSlot[5] = Weapons.STAR_CRASH;
global.weaponUnlocked[5] = true; // Unlocked because there's no RM for it yet
global.weaponSlot[6] = Weapons.RUSH_COIL;
global.weaponUnlocked[6] = true; // Usually, Rush Coil is available from the beginning as well
global.weaponSlot[7] = Weapons.RUSH_JET;
global.weaponUnlocked[7] = true; // We have no RM that unlocks Rush Jet yet
    
global.weaponUnlocked[global.totalWeapons + 1] = true; // E-tank
global.weaponUnlocked[global.totalWeapons + 2] = true; // M-tank
    
    
// Names
global.weaponName[Weapons.MEGA_BUSTER] = "M.BUSTER";
global.weaponName[Weapons.RUSH_COIL] = "R.COIL";
global.weaponName[Weapons.RUSH_JET] = "R.JET";
    
global.weaponName[Weapons.METAL_BLADE] = "M.BLADE";
    
global.weaponName[Weapons.PHARAOH_SHOT] = "P.SHOT";
    
global.weaponName[Weapons.STAR_CRASH] = "S.CRASH";
    
global.weaponName[Weapons.SILVER_TOMAHAWK] = "SILVER.T";
global.weaponName[Weapons.WIND_STORM] = "W.STORM";
    
    
// Ammo
global.weaponAmmo[Weapons.MEGA_BUSTER] = 0;
global.weaponAmmo[Weapons.RUSH_COIL] = 2;
global.weaponAmmo[Weapons.RUSH_JET] = 1; // Per second
    
global.weaponAmmo[Weapons.METAL_BLADE] = 0.25;
    
global.weaponAmmo[Weapons.PHARAOH_SHOT] = 1;
    
global.weaponAmmo[Weapons.STAR_CRASH] = 2; // 2 when fired
global.weaponAmmoContact[Weapons.STAR_CRASH] = 3; // 3 when colliding with an enemy or projectile
    
global.weaponAmmo[Weapons.SILVER_TOMAHAWK] = 1;
global.weaponAmmo[Weapons.WIND_STORM] = 1;