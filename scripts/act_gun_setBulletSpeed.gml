///Determine projectile spd based on angle
thing = argument0;
thing.spd_x = thing.spd * cos(degtorad(thing.image_angle));
thing.spd_y = thing.spd * -sin(degtorad(thing.image_angle));
