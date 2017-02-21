///Enemy is frozen and will do nothing until the player enters a certain radius
if(distance_to_object(par_character) < range)
{
    //Switch to the enemy-specific idle state
    state_switch(idleState);
}
