if instance_exists(objMegaman)
{
    x = objMegaman.x;
    y = objMegaman.y;
}

///Debug keys
if keyboard_check_pressed(vk_f2)
{
    sound_stop_all();
    game_restart();
}
    
if keyboard_check_pressed(vk_f4)
    window_set_fullscreen( !window_get_fullscreen() );
    
if keyboard_check_pressed(vk_escape)
    game_end();

