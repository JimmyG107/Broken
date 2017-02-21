if(instance_exists(par_character))
{
    if(distance_to_object(par_character) < range)
    {
        state_switch("Idle");
    }
}
