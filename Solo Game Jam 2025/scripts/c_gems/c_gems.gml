function gem_make(_icon, _inPool = true){
	var _gem = {
		sprite_index : _icon
	}
	if _inPool{
		array_push(global.GEM_POOL, _gem);
	}
	return _gem;
}

global.GEM_POOL = [];

global.GEM_EMPTY = gem_make(s_iconEmpty, false);
global.GEM_GUN_LEFT = gem_make(s_iconGunLeft, false);
global.GEM_GUN_MIDDLE = gem_make(s_iconGunMiddle, false);
global.GEM_GUN_RIGHT = gem_make(s_iconGunRight, false);
global.GEM_BOUNCE = gem_make(s_iconBounce);
global.GEM_PIERCE = gem_make(s_iconPierce);
global.GEM_HOMING = gem_make(s_iconHoming);
global.GEM_FORK = gem_make(s_iconFork);
global.GEM_BURN = gem_make(s_iconBurn);

function gem_x_pos(i, j){
	return 257 + i*10 - j*10;
}

function gem_y_pos(i, j){
	return 5 + i*10 + j*10;
}

function gem_icon_draw(i, j){
	var _gemSocket = global.gemGrid[i][j];
	var _xPos = gem_x_pos(i, j);
	var _yPos = gem_y_pos(i, j);
	draw_sprite(s_iconFill, _gemSocket.charge, _xPos, _yPos);
	draw_sprite(_gemSocket.gem.sprite_index, 0, _xPos, _yPos);
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