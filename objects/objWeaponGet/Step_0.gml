switch phase
{
    case 0: //Preparing for moving up
        timer += 1;
        if timer >= 15
        {
            timer = 0;
            phase = 1;
        }
    break;
    
    case 1: //Moving up
        megaY -= 8;
        if megaY <= round(global.viewY+(global.viewHeight/2))
        {
            megaY = round(global.viewY+(global.viewHeight/2));
            phase = 2;
        }
    break;
    
    case 2: //Teleporting animation
        timer += 1;
        if timer >= 3
        {
            timer = 0;
            if megaImg < 2
                megaImg += 1;
            else
            {
                megaImg = 0;
                megaSpr = sprMegamanWeaponGet;
                phase = 3;
            }
        }
    break;
    
    case 3: //Waiting
        timer += 1;
        if timer >= 40
        {
            timer = 0;
            phase = 4;
        }
    break;
    
    case 4: //Moving right
        megaX += 2;
        if megaX >= round(global.viewX+(global.viewWidth*0.75))
        {
            megaX = round(global.viewX+(global.viewWidth*0.75));
            phase = 5;
        }
    break;
    
    case 5: //Waiting for text
        timer += 1;
        if timer >= 40
        {
            timer = 0;
            phase = 6;
        }
    break;
    
    case 6: //Show "You got"
        timer += 1;
        
        if timer mod 3 == 0 && text1Alpha < 1
            text1Alpha += 1/3;
            
        if text1Alpha > 1
            text1Alpha = 1;
            
        if timer >= 35
        {
            timer = 0;
            phase = 7;
        }
    break;
    
    case 7: //Show weapon name
        timer += 1;
        
        if timer mod 3 == 0 && text2Alpha < 1
            text2Alpha += 1/3;
            
        if text2Alpha > 1
            text2Alpha = 1;
        
        if timer >= 25
        {
            timer = 0;
            phase = 8;
        }
    break;
    
    case 8: //Flicker between normal and weapon color
        timer += 1;
        if timer >= 40
        {
            timer = 0;
            phase = 9;
        }
    break;
    
    case 9: //Weapon color and timer for leaving
        timer += 1;
        if timer >= 4.5 * 60
        {
            timer = 0;
            var ID;
            ID = instance_create(x, y, objFadeout);
                ID.type = "room";
                ID.myRoom = rmPass;
        }
    break;
}

