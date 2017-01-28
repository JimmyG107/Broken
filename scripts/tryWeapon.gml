if(shot_tick <= 0)
{
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
