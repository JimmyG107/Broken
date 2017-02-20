///Move Weapon
weapons[active_weapon].x = x;
weapons[active_weapon].y = y;



///Update Gun Angle
with weapons[active_weapon]
{
    image_angle = point_direction(x, y, mouse_x + par_character.spd_x, mouse_y + par_character.spd_y);
    flipWeapon();
}
