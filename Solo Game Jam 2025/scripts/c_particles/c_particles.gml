var p = part_type_create();
part_type_sprite(p, s_playerBullet, true, true, false);
part_type_life(p, 13, 13);
part_type_size(p, 0.5, 0.5, 0, 0);

global.playerBulletParticle = p;

var p = part_type_create();
part_type_sprite(p, s_star, true, true, false);
part_type_life(p, 30, 30);
part_type_speed(p, 1, 1, 0, 0);
part_type_direction(p, 270, 270, 0, 0);

global.starParticle = p;