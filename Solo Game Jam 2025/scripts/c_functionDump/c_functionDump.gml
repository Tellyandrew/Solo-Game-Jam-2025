function pressing_left(){
	return (keyboard_check(ord("A")) or keyboard_check(vk_left) or keyboard_check(ord("J")) or keyboard_check(vk_lshift) or mouse_check_button(mb_left) or keyboard_check(vk_space) or mouse_check_button(mb_middle));
}

function pressing_right(){
	return (keyboard_check(ord("D")) or keyboard_check(vk_right) or keyboard_check(ord("L")) or keyboard_check(vk_rshift) or mouse_check_button(mb_right) or keyboard_check(vk_space) or mouse_check_button(mb_middle));
}

function brandom(p = 0.5){
	return random(1) < p;
}

function is_inbounds(_vector){
	return max(abs(2 - _vector.x), abs(2 - _vector.y)) <= 2 or max(abs(6 - _vector.x), abs(6 - _vector.y)) <= 2;
}

function rejig_charge(_nextPosition){
	global.gunCharge = 0;
	for (var i = 0, n = array_length(global.gemsExplored); i < n; i++){
		global.gemGrid[gem_unhash_i(global.gemsExplored[i])][gem_unhash_j(global.gemsExplored[i])].charge = global.gunCharge;
	}
		
	global.gemsExplored = [gem_hash(_nextPosition.x, _nextPosition.y)];
	while(true){
		var _possiblePositions = [
			Vec2_copy_offset(_nextPosition,  1,  0),
			Vec2_copy_offset(_nextPosition,  0,  1),
			Vec2_copy_offset(_nextPosition, -1,  0),
			Vec2_copy_offset(_nextPosition,  0, -1)
		];
		for (var i = 3; i >= 0; i--){
			var _position = _possiblePositions[i];
			if not is_inbounds(_position)
					or global.gemGrid[_position.x][_position.y].gem == global.GEM_EMPTY
					or array_contains(global.gemsExplored, gem_hash(_position.x, _position.y)){
				array_delete(_possiblePositions, i, 1);
			}
		}
			
		var _possiblePositionNumber = array_length(_possiblePositions);
		if _possiblePositionNumber == 0{
			break;
		}
			
		_nextPosition = _possiblePositions[irandom(_possiblePositionNumber - 1)];
			
		array_push(global.gemsExplored, gem_hash(_nextPosition.x, _nextPosition.y));
	}
}