if(use_tick <= 0)
{  //maybe do an inheritence thing here where par_weapon has an abstract useWeapon that is implemented differently in par_gun and par_melee
    show_debug_message(object_get_parent(self));
    if(object_get_parent(object_index) == par_gun)
    {
        shoot();
    }
    else if(object_get_parent(object_index) == par_melee)
    {
        swing();
    }
    
    //make this weapon wait some ticks before firing again
    use_tick = use_cd;
}
