if !global.frozen
{
    // Shooting (before sprite handling to update the sprites properly)
    playerShoot();
    
    // Handle the sprites
    playerHandleSprites();
    
    // General step event code
    playerStep();
    
    // Collision code
    playerCollision();
    
    // Handles moving platform collision
    playerMovingPlatform();
    
    // Pausing
    playerPause();
    
    // Camera
    playerCamera();
    
    // Moving from one section to the next, if possible
    playerSwitchSections();
    
    // Quick weapon switching
    playerSwitchWeapons();
}
else
{
    image_speed = 0;
}

