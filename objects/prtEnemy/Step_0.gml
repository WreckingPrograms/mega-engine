// "Die" (doesn't actually destroy the enemy though)
if healthpoints <= 0
{   
    if canInitDeath 
    {
        beenOutsideView = false;
        visible = false;
        dead = true;    // Enemies don't actually destroy themselves, they become invisible and all collision is neglected
        x = xstart;     // This is done to allow them to still execute code (for respawning)
        y = ystart;
        canInitDeath = false;
        xspeed = 0;
        yspeed = 0;
    }   
}

// Respawning
if respawn 
{
    if beenOutsideView 
    {
        if insideView()
        {
            visible = true;
            dead = false;
            healthpoints = healthpointsStart;
            canInitDeath = true;
            beenOutsideView = false;
        }
    }
}
else
{
    if dead 
        instance_destroy(); // If we can't respawn, there's no point to still be able to execute any code. Destroying the instance saves memory and processing power
}

if !insideView()
{
    beenOutsideView = true;
    
    x = xstart;
    y = ystart;
    healthpoints = 0;
    dead = true;
    visible = false;
    xspeed = 0;
    yspeed = 0;
}
    
    
if dead 
{
    xspeed = 0;
    yspeed = 0;
    exit;
}

