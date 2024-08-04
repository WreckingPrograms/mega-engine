if global.keyDownPressed
{
    playSFX(sfxMenuMove);
    
    var loops;
    loops = 0; // How many times the while-loop has been passed through
    
    while !global.weaponUnlocked[option] || loops == 0
    {
        // The bottom of the left column and the right column;
        // when the bottom of the left column is selected and we press down, we want to select the E-tank
        // for the right column, we want to select the M-tank
        if option != 5 && option != global.totalWeapons 
        {
            option += 1;
            if option < 0
                option = global.totalWeapons;
            else if option > global.totalWeapons
                option = 0;
        }
        else if option == 5 // The bottom of the left column
        {
            option = global.totalWeapons+1; // E-tank
        }
        else // The bottom of the right column
        {
            option = global.totalWeapons+2; // M-tank
        }
            
        if option != global.totalWeapons+1 && option != global.totalWeapons+2
        {
            global.weapon = global.weaponSlot[option];
            with objMegaman event_user(0);
        }
        
        loops += 1;
    }
}
else if global.keyUpPressed
{
    playSFX(sfxMenuMove);
    
    var loops;
    loops = 0;
    
    while !global.weaponUnlocked[option] || loops == 0
    {
        if option == global.totalWeapons+2 // M-tank
        {
            option = global.totalWeapons; // The bottom weapon of the right column
        }
        else if option == global.totalWeapons+1 // E-tank
        {
            if global.totalWeapons > 5
                option = 5; // The bottom weapon of the left column
            else
                option = global.totalWeapons;
        }
        else if option == 6 // The top weapon of the right column
        {
            option = global.totalWeapons+2; // M-tank
        }
        else if option == 0 // The top weapon of the left column
        {
            option = global.totalWeapons+1; // E-tank
        }
        else
        {
            option -= 1;
            if option < 0
                option = global.totalWeapons+1;
            else if option > global.totalWeapons+1
                option = 0;
        }
            
        if option != global.totalWeapons+1 && option != global.totalWeapons+2
        {
            global.weapon = global.weaponSlot[option];
            with objMegaman event_user(0);
        }
        
        loops += 1;
    }
}

if global.keyLeftPressed || global.keyRightPressed
{
    if global.totalWeapons > 5 // If there is a right column of weapons
    && option != global.totalWeapons+1 && option != global.totalWeapons+2 // When the E-tank or M-tank is not selected
    {
        if option > 5
            option -= 6;
        else
            option += 6;
            
        if option > global.totalWeapons
            option = global.totalWeapons;
        else if option < 0
            option = 0;
            
        playSFX(sfxMenuMove);
    }
    
    // E-Tanks and M-Tanks
    if option == global.totalWeapons+1 || option == global.totalWeapons+2
    {
        if option == global.totalWeapons+1
            option = global.totalWeapons+2;
        else
            option = global.totalWeapons+1;
            
        playSFX(sfxMenuMove);
    }
    
    
    while !global.weaponUnlocked[option]
    {
        if option == 6
            option = global.totalWeapons;
        else if option == 0
        {
            if global.totalWeapons > 5
                option = 5;
            else
                option = global.totalWeapons;
        }
        else    
            option -= 1;
    }
    
    if option != global.totalWeapons+1 && option != global.totalWeapons+2
    {
        global.weapon = global.weaponSlot[option];
        with objMegaman event_user(0);
    }
}

