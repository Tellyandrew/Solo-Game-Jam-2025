if global.upgrading{
	exit;
}

x += xVelocity;
y += yVelocity;

if y < 0{
	instance_destroy();
}

var _instance = instance_position(x, y, o_enemy);
if _instance != noone{
	instance_destroy(_instance);
	instance_destroy();
	exit;
}

part_type_orientation(global.playerBulletParticle, image_angle, image_angle, 0, 0, false);
part_particles_create(global.playerBulletParticleSystem, x, y, global.playerBulletParticle, 1);