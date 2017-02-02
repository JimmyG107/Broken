/*
How this level designer works:
1. Generate an array of all of the rooms and halls that will exist in this dungeon.
    a. Determine the number of rooms and halls desired in this dungeon
    b. Create a 2D array 'things' for all of the rooms/halls.  Rows are room/hall #, while columns are the properties of that room such as position and dimentions.
    c. Create the first room, starting at (0, 0), with random dimensions.
    d. Create all of the other halls and rooms as connections to previous objects.
    e. Create the last room.
2. Generate an array of objects in the dungeon (loot, monsters, traps, etc)
    a. Make an 'objects' array for all of the objects that will be in the dungeon
    b. For each loot/monster, choose a room/hall to place it in (from the initial 'things' array), and a random location within that room.
    c. Check if there is already an object at that position in the 'objects' array
        i. if not, add that loot to the objects array
        ii. if so, go back to a.
3. Make the actual room from room_final
    a. Find the farthest rooms in all directions, and get the total height and width of the dungeon.
    b. Create a room, set its dimensions, and set the background tile.
    c. Create a room_final array of all of the objects and things in the room
    d. Loop through the room_final array, creating objects at the specified positions

Congratulations, now you have a dungeon!

Possible improvements:
 - Make halls and rooms store which sides are being used, so that new rooms/halls don't build off of those sides into existing rooms (or have a much less chance to)
*/


//1. Generate an array of all of the rooms and halls that will exist in this dungeon


//a. determine the number of rooms and halls desired in this dungeon

rooms = argument0; //the number of rooms to generate
room_var = argument1; //the amount to randomly vary the above number by
//ie total number of rooms is somewhere random between rooms - room_var and rooms + room_var
halls = argument2; //same as above
hall_var = argument3;
rooms += floor(random_range(-room_var, room_var + 1)); //rooms will vary positively or negatively by room_var
halls += floor(random_range(-hall_var, hall_var + 1));//same


//b. Create a 2D array 'things' for all of the rooms/halls.

things[rooms + halls - 1, 4] = 0;


//c. Create the first room, starting at (0, 0), with random dimensions.

rooms--;
things[rooms + halls, 4] = 0;    //0 = room, 1 = horizontal hall, 1 = vertical hall
things[rooms + halls, 0] = 0;   //x pos
things[rooms + halls, 1] = 0;   //y pos
things[rooms + halls, 2] = floor(random_range(5, 11));  //width
things[rooms + halls, 3] = floor(random_range(5, 11));  //height



//d. Create all of the other halls and rooms as connections to previous objects.
show_debug_message("Generating rooms and halls...");

while(rooms + halls > 0)
{
    show_debug_message("start while loop");
    show_debug_message("rooms = " + string(rooms));
    show_debug_message("halls = " + string(halls));
    
    //determine whether to do a room or a hall
    if(floor(random_range(0, rooms + halls - 1)) < halls || (rooms == 1 && halls == 0))  //randomly choose between rooms and halls, but prefer the one with more remaining to be built.  also leave one room to be built at the very end
    {
        build_room = false;
        halls--;
    }
    else
    {
        build_room = true;
        rooms--;
    }
     show_debug_message("making room:  " + string(build_room));
     show_debug_message("updated rooms = " + string(rooms));
     show_debug_message("updated halls = " + string(halls));
     
    //if room, make width and height
    if(build_room)
    {
        things[rooms + halls, 4] = 0;   //0 is for room
        things[rooms + halls, 2] = floor(random_range(5, 11));
        things[rooms + halls, 3] = floor(random_range(5, 11));
    }
    else   //building a hall
    {
        things[rooms + halls, 4] = floor(random_range(1, 3));   //choose horizontal or vertical
        if(things[rooms + halls, 4] == 1)   //if horizontal
        {   //make the hall wider than it is tall
            things[rooms + halls, 2] = floor(random_range(6, 16));
            things[rooms + halls, 3] = floor(random_range(2, 4));
        }
        else    //the hall is vertical
        {   //make the hall taller than it is wide
            things[rooms + halls, 2] = floor(random_range(2, 4));
            things[rooms + halls, 3] = floor(random_range(6, 16));
        }
    }
    show_debug_message("width = " + string(things[rooms + halls, 2]));
    show_debug_message("height = " + string(things[rooms + halls, 3]));
    
    //pick an existing thing to build off of
    start_room = floor(random_range(rooms + halls + 1, array_height_2d(things)));
    show_debug_message("start_room = " + string(start_room));
    //pick a side of that thing to build off of
    side = floor(random_range(0, 4)); //0 = bottom, 1 = right, 2 = top, 3 = left
    show_debug_message("side = " + string(side));
    //generate start_point_x and start_point_y
    switch side
    {
        case 0: //the room/hall to be added connects to the bottom of an existing room
            things[rooms + halls, 0] = things[start_room, 0] + floor(random_range(0, things[start_room, 2]));
            things[rooms + halls, 1] = things[start_room, 1] + things[start_room, 3];
            break;
        case 1: //the room/hall to be added connects to the right of an existing room
            things[rooms + halls, 0] = things[start_room, 0] + things[start_room, 2];
            things[rooms + halls, 1] = things[start_room, 1] + floor(random_range(0, things[start_room, 3]));
            break;
        case 2: //the room/hall to be added connects to the top of an existing room
            things[rooms + halls, 0] = things[start_room, 0] + floor(random_range(0, things[start_room, 2]));
            things[rooms + halls, 1] = things[start_room, 1] - things[rooms + halls, 3];
            break;
        case 3: //the room/hall to be added connects to the left of an existing room
            things[rooms + halls, 0] = things[start_room, 0] - things[rooms + halls, 3];
            things[rooms + halls, 1] = things[start_room, 1] + floor(random_range(0, things[start_room, 3]));
    }
}



//2. Generate an array of objects in the dungeon (loot, monsters, traps, etc)


//a. Make an 'objects' array for all of the objects that will be in the dungeon

monsters = argument4;
loot = argument5;
traps = argument6;
player_spawn = 1;
player_exit = 1;
total = monsters + loot + traps + player_spawn + player_exit;

objects[total - 1, 2] = 0;


//b. For each loot/monster, choose a room/hall to place it in (from the initial 'things' array), and a random location within that room.

while(total > 0)
{
    
    loop = true;
    while(loop) //find an unoccupied space in the dungeon
    {
        rand_room = floor(random_range(0, array_height_2d(things)));
        obj_x = floor(random_range(things[rand_room, 0], things[rand_room, 0] + things[rand_room, 2])); //generate a random x
        obj_y = floor(random_range(things[rand_room, 1], things[rand_room, 1] + things[rand_room, 3])); //and y
        if(total = array_height_2d(objects))
        {
            loop = false;
        }
        else
        {
            for(test_loot = total; test_loot < array_height_2d(objects); test_loot++) //loop through all of the existing objects
            {
                if(objects[test_loot, 0] != obj_x || objects[test_loot, 1] != obj_y)  //if the x or the y is different, break out of the loop
                {
                    loop = false;
                    break;
                }
            }
        }
    }
    
    //store those x and y values to the objects
    objects[total - 1, 0] = obj_x;
    objects[total - 1, 1] = obj_y;
    
    if(player_spawn > 0)   //if there are more monsters to be made, make this object an enemy
    {
        objects[total - 1, 2] = obj_sir;
        player_spawn--;
    }
    else if(player_exit > 0)   //if there are more monsters to be made, make this object an enemy
    {
        objects[total - 1, 2] = obj_stairs;
        player_exit--;
    }
    else if(traps > 0)   //if there are traps to be made yet, make the object be a trap
    {
        objects[total - 1, 2] = obj_trap;
        traps--;
    }
    else if(loot > 0)   //if there are still loots to be made, make this object a loot
    {
        objects[total - 1, 2] = obj_loot;
        loot--;
    }
    else if(monsters > 0)   //if there are more monsters to be made, make this object an enemy
    {
        objects[total - 1, 2] = obj_enemy;
        monsters--;
    }
    total = monsters + loot + traps + player_spawn + player_exit;
}



//3. Make the actual room from room_final


//a. Find the farthest rooms in all directions, and get the total height and width of the dungeon.

x_min = 0;  //set default mins and maxes at 0
x_max = 0;
y_min = 0;
y_max = 0;
//loop through each of the rooms/halls
for(test_thing = 0; test_thing < array_height_2d(things); test_thing++)
{
    if(things[test_thing, 0] < x_min)   //if one room's x value is less than the current x_min, set x_min equal to this room's x
    {
        x_min = things[test_thing, 0];
    }
    else if(things[test_thing, 0] + things[test_thing, 2] - 1 > x_max)  //if one room's RIGHT x value (x + width - 1) is greater than the current x_max, set x_max equal to x + width - 1
    {
        x_max = things[test_thing, 0] + things[test_thing, 2] - 1;
    }
    if(things[test_thing, 1] < y_min)   //same
    {
        y_min = things[test_thing, 1];
    }
    else if(things[test_thing, 1] + things[test_thing, 3] - 1 > y_max)  //same
    {
        y_max = things[test_thing, 1] + things[test_thing, 3] - 1;
    }
}


//b. Create a room, set its dimensions, and set the background tile.

rm_next = room_add();   //make a blank room
room_set_width(rm_next, x_max - x_min + 1); //set the width equal to the number of spaces between x_min and x_max inclusive
room_set_height(rm_next, y_max - y_min + 1);    //same
room_tile_add(rm_next, bg_floor_wood, 0, 0, 32, 32, 0, 0, 10000)    //make the background tile of the room be clean wood


//c. Create a room_final array of all of the objects and things in the room

/*
0 = empty space
1 = filled space
2 = trap
3 = loot
4 = enemy
5 = player spawn
6 = player exit
*/
room_final[x_max - x_min, y_max - y_min] = 1;   //initialize the array
for(x_current = 0; x_current <= x_max - x_min; x_current++)
{
    for(y_current = 0; y_current <= y_max - y_min; y_current++)
    {
        room_final[x_current, y_current] = 1;   //set all values in the 2d array to 1 (the code for a filled space)
    }
}
for(thing_current = 0; thing_current < array_height_2d(things); thing_current++)    //loop through each room and hall
{
    for(x_pos = things[thing_current, 0]; x_pos < things[thing_current, 0] + things[thing_current, 2]; x_pos++)    //for all x positions
    {
        for(y_pos = things[thing_current, 1]; y_pos < things[thing_current, 1] + things[thing_current, 3]; y_pos++)    //and y positions in each room,
        {
            room_final[x_pos - x_min, y_pos - y_min] = 0;   //make that corresponding position in the master array be an empty space (0).
        }
    }
}
for(object_current = 0; object_current < array_height_2d(objects); object_current++)
{
    if(objects[object_current, 2] == obj_trap)
    {
        room_final[objects[object_current, 0]- x_min, objects[object_current, 1] - y_min] = 2;
    }
    else if(objects[object_current, 2] == obj_loot)
    {
        room_final[objects[object_current, 0] - x_min, objects[object_current, 1] - y_min] = 3;
    }
    else if(objects[object_current, 2] == obj_enemy)
    {
        room_final[objects[object_current, 0] - x_min, objects[object_current, 1] - y_min] = 4;
    }
    else if(objects[object_current, 2] == obj_sir)
    {
        room_final[objects[object_current, 0] - x_min, objects[object_current, 1] - y_min] = 5;
    }
    else if(objects[object_current, 2] == obj_stairs)
    {
        room_final[objects[object_current, 0] - x_min, objects[object_current, 1] - y_min] = 6;
    }
}

//d. Loop through the room_final array, creating objects at the specified positions
for(x_pos = 0; x_pos <= x_max - x_min; x_pos++)
{
    for(y_pos = 0; y_pos <= y_max - y_min; y_pos++)
    {
        if(room_final[x_pos, y_pos] == 1)
        {
            room_instance_add(rm_next, x_pos * 32, y_pos * 32, obj_wall);
        }
        else if(room_final[x_pos, y_pos] == 2)
        {
            room_instance_add(rm_next, x_pos * 32, y_pos * 32, obj_trap);
        }
        else if(room_final[x_pos, y_pos] == 3)
        {
            room_instance_add(rm_next, x_pos * 32, y_pos * 32, obj_loot);
        }
        else if(room_final[x_pos, y_pos] == 4)
        {
            room_instance_add(rm_next, x_pos * 32, y_pos * 32, obj_enemy);
        }
        else if(room_final[x_pos, y_pos] == 5)
        {
            room_instance_add(rm_next, x_pos * 32, y_pos * 32, obj_sir);
            player_x = x_pos;
            player_y = y_pos;
            
        }
        else if(room_final[x_pos, y_pos] == 6)
        {
            room_instance_add(rm_next, x_pos * 32, y_pos * 32, obj_stairs);
        }
    }
}

view_width = 640;
view_height = view_width * 3/4;
room_set_view(rm_next, 0, true, player_x - view_width/2, player_y - view_height/2, view_width, view_height, 0, 0, 1280, 720, 0, 0, 1000, 1000, -1);
room_set_view_enabled(rm_next, true);
room_goto(rm_next);
