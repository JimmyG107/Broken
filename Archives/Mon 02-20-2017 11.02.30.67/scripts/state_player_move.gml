if(state_new)
{
    spd_left = 0;
    spd_right = 0;
    spd_up = 0;
    spd_down = 0;
    snappy = 1.5;
    stopping = 1.5;
}

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
show_debug_message(spd_left);
show_debug_message(spd_right);
show_debug_message(spd_up);
show_debug_message(spd_down);
show_debug_message("");

//Calculate Final x and y speeds from component speeds
spd_x = spd_right - spd_left;
spd_y = spd_down - spd_up;

//If you're gonna bump into a wall, move right up to it
if(place_meeting(x + spd_x, y, par_obstacle))
{
    while(!place_meeting(x + sign(spd_x), y, par_obstacle))
    {
        x += sign(spd_x);
    }
    spd_x = 0;
}
x += spd_x;

//Same as above, but for vertical collisions
if(place_meeting(x, y + spd_y, par_obstacle))
{
    while(!place_meeting(x, y + sign(spd_y), par_obstacle))
    {
        y += sign(spd_y);
    }
    spd_y = 0;
}
y += spd_y;

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
updateCamera();
switchGuns();
updateGuns();
attemptFire();

//Determine if we need to go to the slow state
if(spd_x == 0 && spd_y == 0)
{
    state_switch("Stand");
}
