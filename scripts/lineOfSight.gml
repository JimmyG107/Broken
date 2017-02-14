x1 = argument0; //starting x and y
y1 = argument1;
x2 = argument2; //finishing x and y
y2 = argument3;
target_object = argument4;  //the object to check for on the line of sight


diff_x = x2 - x1;
diff_y = y2 - y1;

diff_max = max(abs(diff_x), abs(diff_y));

inc_x = diff_x / diff_max;
inc_y = diff_y / diff_max;

sight = false;

x_pos = x1;
y_pos = y1;

if(diff_x == 0) //we will have to loop based on y-values, because we can't use x values if there is no difference between initial and final
{
    loop_x = false;
    if(diff_y > 0)
    {
        going_down = true;
    }
    else
    {
        going_down = false;
    }
}
else    //we're fine to loop uwing x values
{
    loop_x = true;
    if(diff_x > 0)
    {
        going_right = true;
    }
    else
    {
        going_right = false;
    }
}
    
    
condition = true;
while(!sight && condition)
{   //while we have not yet seen our target object, AND
    //EITHER we are moving right and we are still to the left of our final destination,
    //OR we are moving left and we are still to the right of our final destination.
    if(position_meeting(x_pos, y_pos, target_object))
    {   //if the current position along the path is touching our target object
        sight = true;   //tell the loop that we do have line of sight
    }
    x_pos += inc_x;
    y_pos += inc_y;
    if(loop_x)
    {
        condition = (going_right && x_pos <= x2) || (!going_right && x_pos >= x2);
    }
    else
    {
        condition = (going_down && y_pos <= y2) || (!going_down && y_pos >= y2);
    }
}
return sight;
