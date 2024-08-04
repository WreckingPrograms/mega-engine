// Change colors depending on the special weapon
// Primary is the helmet color (dark blue), secondary is the shirt color (cyan)

switch global.weapon
{
    case Weapons.MEGA_BUSTER:
        global.primaryCol = make_color_rgb(0, 120, 248);
        global.secondaryCol = make_color_rgb(0, 232, 216);
    break;
    
    case Weapons.RUSH_COIL:
        global.primaryCol = make_color_rgb(216, 40, 0);
        global.secondaryCol = make_color_rgb(255, 255, 255);
    break;
    
    case Weapons.RUSH_JET:
        global.primaryCol = make_color_rgb(216, 40, 0);
        global.secondaryCol = make_color_rgb(255, 255, 255);
    break;
    
    
    
    case Weapons.METAL_BLADE:
        global.primaryCol = make_color_rgb(136, 112, 0);
        global.secondaryCol = make_color_rgb(255, 224, 168);
    break;
    
    
    
    case Weapons.PHARAOH_SHOT:
        global.primaryCol = make_color_rgb(248, 120, 88);
        global.secondaryCol = make_color_rgb(240, 208, 176);
    break;
    
    
    
    case Weapons.STAR_CRASH:
        global.primaryCol = make_color_rgb(228, 92, 16);
        global.secondaryCol = make_color_rgb(248, 184, 0);
    break;
    
    
    
    case Weapons.SILVER_TOMAHAWK:
        global.primaryCol = make_color_rgb(228, 92, 16);
        global.secondaryCol = make_color_rgb(240, 208, 176);
    break;
    
    case Weapons.WIND_STORM:
        global.primaryCol = make_color_rgb(124, 124, 124);
        global.secondaryCol = make_color_rgb(248, 248, 248);
    break;
    
}

global.outlineCol = c_black;


if canStep   // global.keyPausePressed was unknown at the first frame because of event order
{
    if !global.keyPausePressed  // The pause menu also resets the colors as to not show charging colors in the Mega Man sprite at the bottom right
                                // However, we do not want to reset the charge after pausing
    {
        chargeTimer = 0;
        initChargeTimer = 0;
    }
}

