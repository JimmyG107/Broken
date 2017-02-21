wall_x = argument0;
wall_y = argument1;
tile_layer_delete_at(9000, wall_x * 32 - 16, wall_y * 32 - 16);
instance_create(wall_x * 32, wall_y * 32, obj_wall);
setPosAll(wall_x, wall_y, 7);
