
if(shot_cd <= 0)
{
    for(bul = 0; bul < num_bullets; bul++)
    {
        bullet = instance_create(barrel_position_x, barrel_position_y, projectile);
        //set the angle of the bullet
        bullet.image_angle = point_direction(x, y, barrel_position_x, barrel_position_y);
        //spread (modify the angle)
        bullet.image_angle += random_range(-spread, spread);
        //set the bullet's x and y speeds based on its spd variable and angle.
        setBulletSpeed(bullet);
        bullet.scale = 2;
    }
    if(player)
    {
        obj_character.ammo[ammo_type] -= ammo_cost;
        //if this gun is owned by a player, subtract ammo
    }
    
    //make this gun wait some ticks before firing again
    shot_tick = shot_cd;
}
