if(state_new)
{
    show_debug_message("Entering wall escape state...");
    quadrants = ds_list_create();
    q1 = true;
    q2 = true;
    q3 = true;
    q4 = true;
    if(place_meeting(x+1, y, par_obstacle))
    {
        q1 = false;
        q4 = false;
    }
    if(place_meeting(x-1, y, par_obstacle))
    {
        q2 = false;
        q3 = false;
    }
    if(place_meeting(x, y+1, par_obstacle))
    {
        q3 = false;
        q4 = false;
    }
    if(place_meeting(x, y-1, par_obstacle))
    {
        q1 = false;
        q2 = false;
    }
    if(q1)
    {
        ds_list_add(quadrants, 0);
    }
    if(q2)
    {
        ds_list_add(quadrants, 90);
    }
    if(q3)
    {
        ds_list_add(quadrants, 180);
    }
    if(q4)
    {
        ds_list_add(quadrants, 270);
    }
    ds_list_shuffle(quadrants);
    angle = ds_list_find_value(quadrants, 0);
    move_dir = random_range(angle, angle + 90);
    move_time = floor(random_range(31, 91));
    spd_x = spd * cos(degtorad(move_dir));
    spd_y = spd * -sin(degtorad(move_dir));
    ds_list_destroy(quadrants);
}
if(move_time <= 0)
{
    state_switch("Idle");
}
else
{
    move_time--;
    act_move();
}
act_enemy_die();
