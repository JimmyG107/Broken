if(shot_tick <= 0)
{
    shoot();
    
    if(player)
    {
        
        obj_character.ammo[ammo_type] -= ammo_cost;
        //if this gun is owned by a player, subtract ammo
    }
    
    //make this gun wait some ticks before firing again
    shot_tick = shot_cd;
}
