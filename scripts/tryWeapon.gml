if(use_tick <= 0)
{  //maybe do an inheritence thing here where par_weapon has an abstract useWeapon that is implemented differently in par_gun and par_melee
    if(object_get_parent(self) == par_gun)
    {
        shoot();
    }
    else if(object_get_parent(self) == par_melee)
    {
        swing();
    }
    
    //make this weapon wait some ticks before firing again
    use_tick = use_cd;
}
