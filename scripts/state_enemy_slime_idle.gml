if(state_new)
{
    image_speed = .8;
    changeStateCnance = .3;
    chancePerTick = (1-power(1-changeStateCnance, 1/30));   //calculate the chance/tick neccessary to have an overall chance/sec of changeStateChance
    behaviors[4] = "Patrol Straight";
    behaviors[3] = "Patrol Curved";
    behaviors[2] = "Patrol Zigzag";
    behaviors[1] = "Patrol Reverse";
    behaviors[0] = "Patrol Circle";
    idle_time = floor(random_range(31, 151));   //the amount of time (in ticks) that the slime will remain in the idle state
}
if(idle_time > 0)
{
    idle_time--;
}
else
{
    if(place_meeting(x+1, y, par_obstacle) || place_meeting(x-1, y, par_obstacle) || place_meeting(x, y+1, par_obstacle) || place_meeting(x, y-1, par_obstacle))
    {
        state_switch(state_enemy_patrol_escapeWall);
    }
    else
    {
        state_switch(/*behaviors[floor(random_range(0, 5))]*/"Patrol Straight");
    }
}
act_enemy_die();
