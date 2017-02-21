if(state_new)
{
    image_speed = .8;
    changeStateCnance = .3;
    chancePerTick = (1-power(1-changeStateChance, 1/30));   //calculate the chance/tick neccessary to have an overall chance/sec of changeStateChance
    behaviors[4] = state_enemy_slime_patrol_straight;
    behaviors[3] = state_enemy_slime_patrol_curved;
    behaviors[2] = state_enemy_slime_patrol_zigzag;
    behaviors[1] = state_enemy_slime_patrol_reverse;
    behaviors[0] = state_enemy_slime_patrol_circle;
    idle_time = floor(random_range(31, 151));   //the amount of time (in ticks) that the slime will remain in the idle state
}
if(idle_time > 0)
{
    idle_time--;
}
else
{
    state_switch(behaviors[floor(random_range(0, 5))]);
}
