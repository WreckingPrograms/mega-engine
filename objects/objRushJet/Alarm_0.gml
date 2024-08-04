// Teleport away
teleportingUp = true;
sprite_index = sprRushTeleport;
playSFX(sfxTeleportOut);
dead = true;
xspeed = 0;
yspeed = 0;
mask_index = sprNothing;

with objMegaman
{
    if onRushJet 
    {
        onRushJet = false;
        canMove = true;
    }
}

