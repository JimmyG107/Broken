if(state_new)
{
    move_dir = random(360);
    move_time = irandom(60) + 30;   //random integer from 30 to 90
    zig_time = irandom(25) + 5;     //random integer from 5 to 30
    zig_range = irandom(89) + 1;    //random integer from 1 to 90
    zig_zag = irandom(1) * 2 - 1;   //1 if zig, -1 if zag
    zig_time_cur = 0;               //how far until the next zig or zag
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
    move_dir_cur = move_dir + zig_range * zig_zag;  //Calculate the current direction in which to move
    
    spd_x = spd * cos(degtorad(move_dir_cur));  //Calculate the speed vectors for each direction
    spd_y = spd * -sin(degtorad(move_dir_cur));
    
    act_move(); //move
    
    zig_time_cur++;     //count up until the next change in direction
    if(zig_time_cur = zig_time) //check if we need to change direction
    {
        zig_zag *= -1;
        zig_time_cur = 0;
    }
    
    move_time--;    //decrease the timer so that the object doesnt move forever lol
}
act_enemy_checkDie();
