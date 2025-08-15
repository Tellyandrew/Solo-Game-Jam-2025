function gem_make(_icon, _poolPushes = 2){
	var _gem = {
		sprite_index : _icon
	}
	repeat(_poolPushes){
		array_push(global.GEM_POOL, _gem);
	}
	return _gem;
}

global.GEM_POOL = [];

global.GEM_EMPTY = gem_make(s_iconEmpty, 0);
global.GEM_GUN_LEFT = gem_make(s_iconGunLeft, 0);
global.GEM_GUN_MIDDLE = gem_make(s_iconGunMiddle, 0);
global.GEM_GUN_RIGHT = gem_make(s_iconGunRight, 0);
global.GEM_BOUNCE = gem_make(s_iconBounce);
global.GEM_PIERCE = gem_make(s_iconPierce);
global.GEM_HOMING = gem_make(s_iconHoming);
global.GEM_FORK_LEFT = gem_make(s_iconForkLeft, 1);
global.GEM_FORK_RIGHT = gem_make(s_iconForkRight, 1);
global.GEM_BURN_LEFT = gem_make(s_iconBurnLeft, 1);
global.GEM_BURN_RIGHT = gem_make(s_iconBurnRight, 1);

function gem_x_pos(i, j){
	return 257 + i*10 - j*10;
}

function gem_y_pos(i, j){
	return 9 + i*10 + j*10;
}

function gem_icon_draw(i, j){
	var _gemSocket = global.gemGrid[i][j];
	var _xPos = gem_x_pos(i, j);
	var _yPos = gem_y_pos(i, j);
	draw_sprite(s_iconFill, _gemSocket.charge, _xPos, _yPos);
	draw_sprite_ext(_gemSocket.gem.sprite_index, 0, _xPos, _yPos, 1, 1, 0, _gemSocket.gem.sprite_index == s_iconEmpty ? c_white : c_black, 1);
}

function gem_hash(i, j){
	return i + (j << 4);
}

function gem_unhash_i(_hash){
	return _hash & 0b1111;
}

function gem_unhash_j(_hash){
	return _hash >> 4;
}