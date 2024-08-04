if other.canHit 
{  
    // Used to make the player face away from the enemy, but I then found out this wasn't done in the NES games
    /*if spriteGetXCenter() > other.x
        other.image_xscale = 1;
    else
        other.image_xscale = -1;*/
        
    with other playerGetHit(other.contactDamage);
}

/* */
/*  */
