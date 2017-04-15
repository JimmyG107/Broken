if(state_new)
{
    image_speed = .8;
    behaviors[4] = "Patrol Straight";
    behaviors[3] = "Patrol Curved";
    behaviors[2] = "Patrol Zigzag";
    behaviors[1] = "Patrol Reverse";
    behaviors[0] = "Patrol Circle";
    idle_time = 0;//floor(random_range(31, 91));   //the amount of time (in ticks) that the slime will remain in the idle state
}
if(idle_time > 0)
{
    idle_time--;
}
else
{
    if(place_meeting(x+1, y, par_obstacle) || place_meeting(x-1, y, par_obstacle) || place_meeting(x, y+1, par_obstacle) || place_meeting(x, y-1, par_obstacle))
    {   //if next to a wall
        state_switch("Escape Wall");    //go away from the wall
    }
    else    //otherwise, pick a random patrol behavior and run it!
    {
        patrol_path = behaviors[floor(random_range(0, 5))];
        show_debug_message("Executing patrol path " + patrol_path);
        state_switch(patrol_path);
    }
}
act_enemy_checkDie();
