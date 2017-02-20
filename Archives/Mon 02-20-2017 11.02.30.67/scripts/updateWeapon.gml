weapons[active_weapon].x = x;
weapons[active_weapon].y = y;
with(weapons[active_weapon])
{
    if(player)
    {
        image_angle = point_direction(x, y, mouse_x, mouse_y);
        if(image_angle > 90 && image_angle <= 270)
        {
            image_yscale = -1 * scale;
        }
        else
        {
            image_yscale = 1 * scale;
        }
        image_xscale = scale;
    }
    else    //if an enemy is holding this gun
    {
        if(!lineOfSight(x, y, obj_character.x, obj_character.y, par_obstacle))
        {
            weapons[active_weapon].image_angle = point_direction(x, y, obj_character.x, obj_character.y);
        }
    }
}
