if global.atStart{
	exit;
}

if not global.upgrading{
	global.gunCharge++;
	global.gunCharge = min(global.gunCharge, 19);
	
	with o_player{
		var _hit = false;
		if iFrames <= 0{
			var _instance = instance_place(x, y, o_enemyShootBall);
			if _instance != noone{
				instance_destroy(_instance);
				_hit = true;
			}else if place_meeting(x, y, o_enemy){
				_hit = true;
			}
		}
		if _hit{
			audio_play_sound(u_hit, 900, false);
			global.lives--;
			iFrames = 128;
			if global.lives < 0{
				instance_destroy(o_player);
			}
		}
	}
	
	part_system_update(global.playerBulletParticleSystem);
	
	part_particles_create(global.starParticleSystem, irandom_range(1, 104), irandom_range(-30, 187), global.starParticle, 1);
	
	part_system_update(global.starParticleSystem);
}

for (var i = 0, n = array_length(global.gemsExplored); i < n; i++){
	global.gemGrid[gem_unhash_i(global.gemsExplored[i])][gem_unhash_j(global.gemsExplored[i])].charge = global.gunCharge;
}

if not instance_exists(o_player){
	if keyboard_check_pressed(ord("R")){
		game_restart();
	}
}