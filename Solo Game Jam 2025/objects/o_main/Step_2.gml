if global.atStart{
	exit;
}

if not global.upgrading{
	global.gunCharge++;
	global.gunCharge = min(global.gunCharge, 19);
	
	with o_player{
		if place_meeting(x, y, o_enemy) and (not iFrames > 0){
			global.lives--;
			iFrames = 128;
			if global.lives < 0{
				instance_destroy(o_player);
			}
		}
	}
	
	part_system_update(global.playerBulletParticleSystem);
}

for (var i = 0, n = array_length(global.gemsExplored); i < n; i++){
	global.gemGrid[gem_unhash_i(global.gemsExplored[i])][gem_unhash_j(global.gemsExplored[i])].charge = global.gunCharge;
}

if not instance_exists(o_player){
	if keyboard_check_pressed(ord("R")){
		game_restart();
	}
}