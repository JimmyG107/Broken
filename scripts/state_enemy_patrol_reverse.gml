if(state_new)
{
    move_dir = random_range(0, 360);
    reverse_time = floor(random_range(11, 61));
    move_time = floor(random_range(71, 121));
    spd_x = spd * cos(degtorad(move_dir));
    spd_y = spd * -sin(degtorad(move_dir));
}
if(move_time <= 0)
{
    state_switch("Idle");
}
else if(!collision_line(x, y, par_character.x, par_character.y, par_obstacle, false, true))
{
    state_switch("Chase");
}
else
{
    if(reverse_time == 0)
    {
        spd_x *= -1;
        spd_y *= -1;
    }
    act_move();
    reverse_time--;
    move_time--;
}
act_enemy_checkDie();
