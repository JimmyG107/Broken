if(state_new)
{
    move_time = floor(random_range(11, 91));
    move_dir = random_range(0, 360);
    spd_x = spd * radtodeg(cos(move_dir));
    spd_y = spd * radtodeg(sin(move_dir));
    show_debug_message("spd_x = " + string(spd_x));
    show_debug_message("spd_y = " + string(spd_y));
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
