///Update Gun Angle
for(i = 0; i < array_length_1d(weapons); i++)
{
    with weapons[i]
    {
        image_angle = point_direction(x, y, mouse_x, mouse_y);
        flipWeapon();
    }
}
