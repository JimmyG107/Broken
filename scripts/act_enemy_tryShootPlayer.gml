//If player is in line of sight and if randomly successful, attempt to shoot
if(!lineOfSight(x, y, obj_character.x, obj_character.y, par_obstacle) && random(1) <= 1-power(1-chance_firing, 1/30))
{
    with (weapons[active_weapon])
    {
        act_weapon_tryUse();
    }
}
