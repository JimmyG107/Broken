if(collision_line(x, y, par_character.x, par_character.y, par_obstacle, false, true))
{   //the enemy has lost sight of the character
    state_switch("Idle");
}
else
{
    move_dir = point_direction(x, y, par_character.x, par_character.y);
    spd_x = spd * cos(degtorad(move_dir));
    spd_y = spd * -sin(degtorad(move_dir));
    act_move();
}
act_enemy_checkDie();
