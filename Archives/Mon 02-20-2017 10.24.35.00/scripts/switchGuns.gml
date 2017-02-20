///Switch Guns
if(spaceKeyPressed)
{
    active_weapon++;
    num_weapons = array_length_1d(weapons);
    if(active_weapon = num_weapons)
    {
        active_weapon = 0;
    }
    for(i = 0; i < num_weapons; i++)
    {
        if(i = active_weapon)
        {
            weapons[i].active = true;
        }
        else
        {
            weapons[i].active = false;
        }
    }
}
