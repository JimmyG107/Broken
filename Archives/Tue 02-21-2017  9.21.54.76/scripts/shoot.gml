for(bul = 0; bul < num_bullets; bul++)
{
    bullet = instance_create(barrel_position_x, barrel_position_y, projectile);
    //set the angle of the bullet
    bullet.image_angle = point_direction(x, y, barrel_position_x, barrel_position_y);
    //spread (modify the angle)
    bullet.image_angle += random_range(-spread, spread);
    bullet.spd = bulletSpeed;
    bullet.slow_spd = bulletSpeedDecay;
    //set the bullet's x and y speeds based on its spd variable and angle.
    setBulletSpeed(bullet);
    bullet.scale = 2;
    bullet.damage = damage;
    if player bullet.create_source = "player";
}
if player par_character.ammo[ammo_type] -= ammo_cost;
//if this gun is owned by a player, subtract ammo
