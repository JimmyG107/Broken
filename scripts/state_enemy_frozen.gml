///Enemy is frozen and will do nothing until the player enters a certain radius
if(state_new)
{
    range = 500;
}
if(distance_to_object(par_character) < range)
{
    state_switch("Idle");
}
