///Attempt to Fire Primary Weapon
//if you are clicking and you have enough ammo, 
if(lMouse && ammo[weapons[active_weapon].ammo_type] >= weapons[active_weapon].ammo_cost)
{   //go into the active weapon and shoot it
    with (weapons[active_weapon])
    {
        tryWeapon();
    }
}
