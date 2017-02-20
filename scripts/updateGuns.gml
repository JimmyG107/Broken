///Move Weapon
weapons[active_weapon].x = x;
weapons[active_weapon].y = y;
if(keyboard_check(ord('J')))
{
    show_debug_message("Gun x:  " + string(x));
    show_debug_message("Gun y:  " + string(y));
    show_debug_message("Mouse x:  " + string(mouse_x));
    show_debug_message("Mouse y:  " + string(mouse_y));
}


///Update Gun Angle
with weapons[active_weapon]
{
    image_angle = point_direction(x, y, mouse_x, mouse_y);
    flipWeapon();
}
