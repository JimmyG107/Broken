x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
target_object = argument4;


diff_x = x2 - x1;
diff_y = y2 - y1;

diff_max = max(abs(diff_x), abs(diff_y));

inc_x = diff_x / diff_max;
inc_y = diff_y / diff_max;

sight = false;

if(diff_x > 0)
{
    going_right = true;
}
else
{
    going_right = false;
}
x_pos = x1;
y_pos = y1;

while(!sight && ((going_right && x_pos <= x2) || (!going_right && x_pos >= x2)))
{   //while we have not yet seen our target object, AND
    //EITHER we are moving right and we are still to the left of our final destination,
    //OR we are moving left and we are still to the right of our final destination.
    if(position_meeting(x_pos, y_pos, target_object))
    {   //if the current position along the vector is touching our target object
        sight = true;   //tell the loop that we do have line of sight
    }
    x_pos += inc_x;
    y_pos += inc_y;
}
return sight;
