if(state_new)
{
    move_dir = random(360);
    move_time = floor(random_range(11, 91));
}
//Calculate spd_x and spd_y
spd_x = spd * cos(degtorad(move_dir));
spd_y = spd * -sin(degtorad(move_dir));

//Move
act_move();
