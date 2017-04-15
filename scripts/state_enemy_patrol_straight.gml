if(state_new)
{
    move_time = floor(random_range(11, 91));
    move_dir = random_range(0, 360);
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
    move_time--;
    act_move();
}
act_enemy_checkDie();
