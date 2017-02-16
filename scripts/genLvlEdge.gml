lvlEdge = argument0;
switch lvlEdge
{
    case ("left"):
        start_x = global.genLeft - 32;
        end_x = start_x;
        start_y = global.genUp;
        end_y = global.genDown;
        global.genLeft -= 32;
        break;
    case "right":
        start_x = global.genRight + 32;
        end_x = start_x;
        start_y = global.genUp;
        end_y = global.genDown;
        global.genRight += 32;
        break;
    case "up":
        start_x = global.genLeft;
        end_x = global.genRight;
        start_y = global.genUp - 32;
        end_y = start_y;
        global.genUp -= 32;
        break;
    case "down":
        start_x = global.genLeft;
        end_x = global.genRight;
        start_y = global.genDown + 32;
        end_y = start_y;
        global.genDown += 32;
        break;
}
for(create_x = start_x; create_x <= end_x; create_x += 32)
{
    for(create_y = start_y; create_y <= end_y; create_y += 32)
    {
        tile_add(bg_floor_wood, 0, 0, 32, 32, create_x - 16, create_y - 16, 10000);
        setPosAll(create_x/32, create_y/32, 1);
        tile_add(bg_wall, 0, 0, 32, 32, create_x - 16, create_y - 16, 9000);
    }
}
