///Aim the enemy's gun at the player
if(!lineOfSight(x, y, obj_character.x, obj_character.y, par_obstacle))
{
    with(weapons[active_weapon])
    {
        image_angle = point_direction(x, y, obj_character.x, obj_character.y);
        act_weapon_checkFlip();
    }
}
