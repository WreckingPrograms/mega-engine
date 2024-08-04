// Teleport to the checkpoint location, if we hit a checkpoint
if global.checkpoint 
{
    x = global.checkpointX;
    y = global.checkpointY;
}


// Initialize the camera
newSectionXOffset = 0;
newSectionYOffset = 0;
playerCameraInit();

// Physics variables
grav = 0.25; // The player's gravity
gravWater = 0.38 * grav; // The player's gravity in water
jumpSpeed = 4.75 + grav*2;  // Dunno why grav needs to be multiplied by 2, but MM jumps as high as in MM5 when doing so
jumpSpeedWater = 4.85 + grav*2;
walkSpeed = 1.296875;
maxVspeed = 7;
stepSpeed = 1/7;
stepFrames = 7;
iceDec = 0.025; // The deceleration on ice when not holding any buttons
iceDecWalk = 0.05; // The deceleration on ice when moving in the opposite direction
slideSpeed = 2.5;
slideFrames = 26;
climbSpeed = 1.296875; // Official value of MM3
initChargeTime = 20; // The amount of frames after which to start charging after the shooting animation is complete
chargeTime = 57; // Official value of MM6
hitTime = 20; // The amount of frames you experience knockback after getting hit


// Variables
ground = false;
prevGround = false;
prevXScale = image_xscale;
isStep = false;
stepTimer = 0;
canInitStep = true; // Can we initialize sidestepping?
xspeed = 0;
yspeed = 0;
canMinJump = true;
canMove = true;
canSpriteChange = true;
canShoot = true;
isShoot = false;
isThrow = false;
shootTimer = 0;
isSlide = false;
slideTimer = 0;
canHit = true;
isHit = false;
hitTimer = 0;
drawHitspark = false;
invincibilityTimer = 0;
isCharge = false;
chargeTimer = 0;
initChargeTimer = 0; // The timer for when to start charging after exiting the shooting animation
canGravity = true;
climbing = false;
climbSpriteTimer = 0;
canStep = false; // We can actually perform the step event even if canStep = false; it's merely used to block certain events from happening at the first frame, as canStep becomes true after 1 frame
alarm[0] = 1; // For canStep
pharaohShotInitTimer = 0;
teleporting = false;
teleportY = 0;
teleportTimer = 0;
deathByPit = false; // Did we die by falling in a bottomless pit?
playLandSound = true; // Should we play the landing SFX when colliding with a floor? (Disabled on ladders, for example)
playLandSoundTimer = 2; // Lasts two frames, since it takes 1 extra frame for the collision code to register
currentGrav = grav; // Normal gravity or water gravity?
currentJumpSpeed = jumpSpeed; // Normal jump speed or water jump speed?
inWater = false;
bubbleTimer = 0; // Timer for the air bubble MM creates under water
blinkTimer = 0; // Timer for MM's blinking animation when standing still
blinkTimerMax = 120;
blinkImage = 0; // 0 for no blinking, 1 for blinking
blinkDuration = 8; // The amount of frames the blinking lasts
drawWeaponIcon = false; // Whether or not we should draw the weapon icon above our head (used when using quick weapon switching)
drawWeaponIconTimer = -1;
onRushJet = false; // Are we on the Rush Jet?
movedByPlatform = false;
movedPlatformID = -20;
canSlide = true;
canSlideTimer = 0;

global.outlineCol = c_black;


// Variable sprites
spriteStand = sprMegamanStand;
spriteJump = sprMegamanJump;
spriteWalk = sprMegamanWalk;
spriteStep = sprMegamanStep;
spriteClimb = sprMegamanClimb;
spriteGetup = sprMegamanClimbGetup; // Can also be sprMegamanClimbShoot, thus it's variable

// Static sprites
spriteSlide = sprMegamanSlide;
spriteHit = sprMegamanHit;
spriteTeleport = sprMegamanTeleport;

// Set the correct whitemask colors
event_user(0);


// Show the READY text
showReady = true;
readyTimer = 0;
canSpriteChange = false;
canMove = false;
canGravity = false;
canPause = false;
image_speed = 0;

