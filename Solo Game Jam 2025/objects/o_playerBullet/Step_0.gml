if global.upgrading{
	exit;
}

if homing > 0{
	var _instance = instance_nearest(x, y, o_enemy);
	if _instance != noone{
		var _direction = angle_difference(point_direction(x, y, _instance.x, _instance.y), image_angle);
		image_angle += sign(_direction)*min(abs(_direction), homing);
		var _magnitude = point_distance(0, 0, xVelocity, yVelocity);
		xVelocity = lengthdir_x(_magnitude, image_angle);
		yVelocity = lengthdir_y(_magnitude, image_angle);
	}
}

if forkTimer++ == 9{
	if forksLeft-- > 0{
		var _magnitude = point_distance(0, 0, xVelocity, yVelocity);
		with instance_create_depth(x, y, DEPTH.PLAYER_PROJECTILE, o_playerBullet){
			xVelocity = lengthdir_x(_magnitude, other.image_angle + 120);
			yVelocity = lengthdir_y(_magnitude, other.image_angle + 120);
			image_angle = other.image_angle + 120;
			bounces = other.bounces;
			pierces = other.pierces;
			homing = other.homing;
			forksLeft = 0;
			forksRight = 0;
			tick = other.tick;
		}
	}
	if forksRight-- > 0{
		var _magnitude = point_distance(0, 0, xVelocity, yVelocity);
		with instance_create_depth(x, y, DEPTH.PLAYER_PROJECTILE, o_playerBullet){
			xVelocity = lengthdir_x(_magnitude, other.image_angle + 240);
			yVelocity = lengthdir_y(_magnitude, other.image_angle + 240);
			image_angle = other.image_angle + 240;
			bounces = other.bounces;
			pierces = other.pierces;
			homing = other.homing;
			forksLeft = 0;
			forksRight = 0;
			tick = other.tick;
		}
	}
	forkTimer = 0;
}

x += xVelocity;
y += yVelocity;

part_type_orientation(global.playerBulletParticle, image_angle, image_angle, 0, 0, false);
part_particles_create(global.playerBulletParticleSystem, x, y, global.playerBulletParticle, 1);

var _hasBounced = false;
if y <= 1 or y >= 192 - 1{
	if bounces > 0{
		yVelocity = -yVelocity;
		_hasBounced = true;
	}else{
		instance_destroy();
	}
}
if x <= 1 or x >= 108 - 1{
	if bounces > 0{
		xVelocity = -xVelocity;
		_hasBounced = true;
	}else{
		instance_destroy();
	}
}
if _hasBounced{
	image_angle = point_direction(0, 0, xVelocity, yVelocity);
	--bounces;
	canUpgrade = false;
}

if canUpgrade{
	var _instance = instance_position(x, y, o_upgrade);
	if _instance != noone{
		if _instance.y >= 0 and _instance.tick < tick{
			audio_play_sound(u_upgrade, 800, false);
			
			global.upgrading = true;
			global.gunCharge = 0;
		
			global.gemAddGem = _instance.gem;
			global.gemAddTick = 0;
			global.lockoutLeft = pressing_left();
			global.lockoutRight = pressing_right();
		
			var _upgradeLeft = _instance.connector.upgradeLeft;
			var _upgradeRight = _instance.connector.upgradeRight;
			instance_destroy(_instance.connector);
			instance_destroy(_upgradeLeft);
			instance_destroy(_upgradeRight);
		
			--pierces;
			if pierces < 0{
				instance_destroy();
				exit;
			}
			
			canUpgrade = false;
		}
	}
}

while pierces >= 0{
	var _instance = instance_position(x, y, o_enemy);
	if _instance == noone or _instance.invincible{
		break;
	}
	if not audio_is_playing(u_explosion){
		audio_play_sound(u_explosion, 0, false);
	}
	global.score += _instance.value;
	global.fakeScore += _instance.value;
	instance_destroy(_instance);
	--pierces;
}
if pierces < 0{
	instance_destroy();
	exit;
}