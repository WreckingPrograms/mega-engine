//Teleport away
teleportingUp = true;
sprite_index = sprRushTeleport;
playSFX(sfxTeleportOut);
dead = true;
xspeed = 0;
yspeed = 0;
mask_index = sprNothing;

with objMegaman
{
    if onRushJet == true
    {
        onRushJet = false;
        canMove = true;
    }
}

