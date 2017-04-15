if(state_new)
{
    move_dir = random(360);
    move_time = floor(random_range(11, 151));
    rot = floor(random_range(3, 13)) * (floor(random(2)) * 2 - 1);//the first bit gets an integer 1-4, the second one gets positive or negative
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
    //Calculate spd_x and spd_y
    spd_x = spd * cos(degtorad(move_dir));
    spd_y = spd * -sin(degtorad(move_dir));
    
    //Move
    act_move();
    move_time--;
    
    //Rotate
    move_dir += rot;
}
act_enemy_checkDie();
