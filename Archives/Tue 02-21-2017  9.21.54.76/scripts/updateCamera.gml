///Move Camera
if(instance_exists(camera))
{
    camera.x = x;
    camera.y = y;
    
    with(camera)
    {
        //Update View
        view_xview = x - view_wview/2;
        view_yview = y - view_hview/2;
        if(keyboard_check(ord('J')))
        {
        show_debug_message("Camera x:  " + string(x));
        show_debug_message("Camera y:  " + string(y));
        show_debug_message("Mouse x:  " + string(mouse_x));
        show_debug_message("Mouse y:  " + string(mouse_y));
        }
        
        ///Generate Level Edges
        if(view_xview < global.genLeft)
        {
            genLvlEdge("left");
        }
        else if(view_xview + view_wview > global.genRight)
        {
            genLvlEdge("right");
        }
        if(view_yview < global.genUp)
        {
            genLvlEdge("up");
        }
        else if(view_yview + view_hview > global.genDown)
        {
            genLvlEdge("down");
        }
    }
}


