//If you're gonna bump into a wall, move right up to it
if(place_meeting(x + spd_x, y, par_obstacle))
{
    dist = 0;
    while(!place_meeting(x + dist + sign(spd_x), y, par_obstacle))
    {
        dist += sign(spd_x);
    }
    spd_x = dist;
}
x += spd_x;

//Same as above, but for vertical collisions
if(place_meeting(x, y + spd_y, par_obstacle))
{
    dist = 0;
    while(!place_meeting(x, y + dist + sign(spd_y), par_obstacle))
    {
        dist += sign(spd_y);
    }
    spd_y = dist;
}
y += spd_y;
