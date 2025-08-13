function Gem(_icon) constructor{
	sprite_index = _icon;
}

global.GEM_EMPTY = new Gem(s_iconEmpty);
global.GEM_GUN_LEFT = new Gem(s_iconGunLeft);
global.GEM_GUN_MIDDLE = new Gem(s_iconGunMiddle);
global.GEM_GUN_RIGHT = new Gem(s_iconGunRight);

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

function GemSearchNode(_hash) constructor{
	hash = _hash;
	children = [];
}