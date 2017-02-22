if(state_new)
{
    spd_left = 0;
    spd_right = 0;
    spd_up = 0;
    spd_down = 0;
    snappy = 2;
    stopping = 2;
}

//Control Guns
act_character_updateGunAngle();
act_character_switchGuns();
act_character_attemptFire();

//Change Speeds from Key Input
spd_left += (aKey * snappy - !aKey * stopping);
spd_right += (dKey * snappy - !dKey * stopping);
spd_up += (wKey * snappy - !wKey * stopping);
spd_down += (sKey * snappy - !sKey * stopping);

//Cap Speeds at Max Spd
if spd_left > spd_max spd_left = spd_max;
if spd_right > spd_max spd_right = spd_max;
if spd_up > spd_max spd_up = spd_max;
if spd_down > spd_max spd_down = spd_max;

//Min-Cap Speeds at 0
if spd_left < 0 spd_left = 0;
if spd_right < 0 spd_right = 0;
if spd_up < 0 spd_up = 0;
if spd_down < 0 spd_down = 0;

//Print spds to console
if(global.debug_mode)
{
    show_debug_message("Speed Left = " + string(spd_left));
    show_debug_message("Speed Right = " + string(spd_right));
    show_debug_message("Speed Up = " + string(spd_up));
    show_debug_message("Speed Down = " + string(spd_down));
}

//Calculate Final x and y speeds from component speeds
spd_x = spd_right - spd_left;
spd_y = spd_down - spd_up;

act_move();

//Nullify spd_[direction] if hitting a wall
if(place_meeting(x+1, y, par_obstacle))
{
    spd_right = 0;
}
if(place_meeting(x-1, y, par_obstacle))
{
    spd_left = 0;
}
if(place_meeting(x, y+1, par_obstacle))
{
    spd_down = 0;
}
if(place_meeting(x, y-1, par_obstacle))
{
    spd_up = 0;
}

//Other Behaviors
act_character_updateCamera();
act_character_updateGunPos();

//Determine if we need to go to the slow state
if(spd_x == 0 && spd_y == 0)
{
    state_switch("Stand");
}
