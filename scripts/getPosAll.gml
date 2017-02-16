/*
rom_next1 is the 1st quadrant
2 is the 2nd, 3 is the 4th, and room_next is the 4th (the main room)
the 4th quadrant includes x and y [0, ∞], and the other arrays are stacked right beside (but NOT overlapping) that one.
So, room_next1[0, 0] is actually (0, 1) on the coordinate plane.
Keep in mind that in GameMaker, the Y axis is flipped, so (0, 1) on the coordinate plane is (0, -1) in the room. (without accounting for scale)
*/
x_pos = argument0;
y_pos = argument1;

if(x_pos < 0)   //left
{
    if(y_pos < 0)   //up
    {
        return_value = global.room_final2[x_pos*-1 - 1, y_pos * -1 - 1];
    }
    else    //down
    {
        return_value = global.room_final3[x_pos*-1 - 1, y_pos];
    }
}
else    //right
{
    if(y_pos < 0)   //up
    {
        return_value = global.room_final1[x_pos, y_pos * -1 - 1];
    }
    else    //down
    {
        return_value = global.room_final[x_pos, y_pos];
    }
}
return return_value;
