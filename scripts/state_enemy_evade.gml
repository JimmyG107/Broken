///Run away from the player
if(state_new)
{
    idle_range = 1000;
}
if(distance_to_object(par_character) > idle_range)
{
    state_switch("Idle");
}
