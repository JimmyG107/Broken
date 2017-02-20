///Update Gun Angle
with weapons[active_weapon]
{
    image_angle = point_direction(x, y, mouse_x, mouse_y);
    flipWeapon();
}
