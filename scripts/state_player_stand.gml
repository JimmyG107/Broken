//initialize vairables
if(state_new)
{
    move_h = false;
    move_v = false;
    spd_x = 0;
    spd_y = 0;
}

updateCamera();
switchGuns();
updateGuns();
attemptFire();

//Check if we need to exit to move state

//determine attempted vertical movement
if(wKey && !sKey)
{
    att_move_v = "up";
}
else if(!wKey && sKey)
{
    att_move_v = "down";
}
else
{
    att_move_v = noone;
}

//determine attempted horizontal movement
if(aKey && !dKey)
{
    att_move_h = "left";
}
else if(!aKey && dKey)
{
    att_move_h = "right";
}
else
{
    att_move_h = noone;
}

//see if we can move in the vertical direction or if there is a wall there
if(att_move_v != noone)
{
    if( (att_move_v == "up" && !place_meeting(x, y-1, obj_wall)) ||  //if trying to go up and there is space to go up
        (att_move_v == "down" && !place_meeting(x, y+1, obj_wall)))  //if trying to go down and there is space to go down
    {
        move_v = true;
    }
}

//see if we can move in the horizontal direction or if there is a wall there
if(att_move_h != noone)
{
    if( (att_move_h == "left" && !place_meeting(x-1, y, obj_wall)) ||  //if trying to go left and there is space to go left
        (att_move_h == "right" && !place_meeting(x+1, y, obj_wall)))  //if trying to go right and there is space to go right
    {
        move_h = true;
    }
}

//Finally, if we are moving either vertically or horizontally, do so.
if(move_h || move_v)
{
    state_switch("Move");
}
