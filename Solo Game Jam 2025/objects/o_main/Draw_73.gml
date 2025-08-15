draw_sprite_ext(s_1x1, 0, 0, 0, 106, 192, 0, #0000FF, 1);

var _sidePadding = 2;

var _yPos = _sidePadding;
draw_text(_sidePadding, _yPos, "REWARD");
draw_text(43, _yPos, "LIVES");

draw_set_halign(fa_right);
draw_text(106 - _sidePadding, _yPos, "SCORE");
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 25, 1, 0, c_white, 1);
draw_sprite_ext(s_1x1, 0, 43, _yPos, 19, 1, 0, c_white, 1);
draw_sprite_ext(s_1x1, 0, 106 - _sidePadding - 20, _yPos, 19, 1, 0, c_white, 1);
_yPos += 2;
draw_text_colour(106 - _sidePadding, _yPos, global.score, #00FFFF, #00FFFF, #00FFFF, #00FFFF, 1);
var _offset = (global.lives - 1)*5;
for (var i = 0; i < global.lives; i++){
	draw_sprite(s_player, 0, 48 - _offset + i*10, _yPos);
}
//for (var i = 0; i < 3; i++){
//	draw_sprite(s_player, 0, _sidePadding + i*10, _yPos);
//}
draw_set_halign(fa_left);
draw_text_colour(_sidePadding, _yPos, nextReward, #00FFFF, #00FFFF, #00FFFF, #00FFFF, 1);

_yPos = 114;
draw_text_colour(_sidePadding, _yPos, "UPGRADE INFORMATION", c_white, c_white, c_white, c_white, 1);
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 76, 1, 0, c_white, 1);
_yPos += 0;
var _colour = #00FFFF;
draw_set_halign(fa_right);
draw_sprite_ext(s_iconGunLeft, 0, -4, _yPos, 1, 1, 0, _colour, 1);
draw_sprite_ext(s_iconGunMiddle, 0, 10 - 4, _yPos, 1, 1, 0, _colour, 1);
draw_sprite_ext(s_iconGunRight, 0, 20 - 4, _yPos, 1, 1, 0, _colour, 1);
_yPos += 7;
draw_text_colour(106 - _sidePadding, _yPos, "SHOOTS YOUR GUNS", _colour, _colour, _colour, _colour, 1);
_yPos += 3;
draw_sprite_ext(s_iconForkLeft, 0, -4, _yPos, 1, 1, 0, _colour, 1);
draw_sprite_ext(s_iconForkRight, 0, 10 - 4, _yPos, 1, 1, 0, _colour, 1);
_yPos += 8;
draw_text_colour(106 - _sidePadding, _yPos, "FORKS YOUR BULLETS", _colour, _colour, _colour, _colour, 1);
_yPos += 3;
draw_sprite_ext(s_iconBurnLeft, 0, -4, _yPos, 1, 1, 0, _colour, 1);
draw_sprite_ext(s_iconBurnRight, 0, 10 - 4, _yPos, 1, 1, 0, _colour, 1);
_yPos += 8;
draw_text_colour(106 - _sidePadding, _yPos, "SHOOTS EXTRA BULLETS", _colour, _colour, _colour, _colour, 1);
_yPos += 4;
draw_sprite_ext(s_iconBounce, 0, -4, _yPos, 1, 1, 0, _colour, 1);
_yPos += 7;
draw_text_colour(106 - _sidePadding, _yPos, "+1 BULLET BOUNCES", _colour, _colour, _colour, _colour, 1);
_yPos += 4;
draw_sprite_ext(s_iconPierce, 0, -4, _yPos, 1, 1, 0, _colour, 1);
_yPos += 7;
draw_text_colour(106 - _sidePadding, _yPos, "+1 BULLET PIERCES", _colour, _colour, _colour, _colour, 1);
_yPos += 4;
draw_sprite_ext(s_iconHoming, 0, -4, _yPos, 1, 1, 0, _colour, 1);
_yPos += 7;
draw_text_colour(106 - _sidePadding, _yPos, "+1 BULLET HOMING", _colour, _colour, _colour, _colour, 1);

draw_set_halign(fa_left);

_yPos = 25;
draw_text(_sidePadding, _yPos, "INSTRUCTIONS");
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 47, 1, 0, c_white, 1);
_yPos += 4;
draw_text_colour(_sidePadding, _yPos, "MOVE TO THE LINE TO SHOOT", _colour, _colour, _colour, _colour, 1);

_yPos += 9;
draw_text(_sidePadding, _yPos, "CONTROLS WHEN PILOTING");
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 87, 1, 0, c_white, 1);
_yPos += 4;
draw_text_colour(_sidePadding, _yPos, "- HOLD [A] TO MOVE LEFT\n- HOLD [D] TO MOVE RIGHT\n- HOLD [A]+[D] TO MOVE UP", _colour, _colour, _colour, _colour, 1);

_yPos += 25;

draw_text(_sidePadding, _yPos, "CONTROLS WHEN UPGRADING");
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 91, 1, 0, c_white, 1);
_yPos += 4;
draw_text_colour(_sidePadding, _yPos, "- RELEASE [A] TO GO LEFT\n- RELEASE [D] TO GO RIGHT\n- HOLD [A]+[D] TO UPGRADE", _colour, _colour, _colour, _colour, 1);


draw_sprite_ext(s_1x1, 0, 105, 0, 1, 192, 0, #FFFFFF, 1);

draw_sprite_ext(s_1x1, 0, 214, 0, 106, 192, 0, #0000FF, 1);

draw_sprite_ext(s_1x1, 0, 214, 0, 1, 192, 0, #FFFFFF, 1);

draw_text(106 + 108 + 38, _sidePadding, "UPGRADES");

for (var i = 0; i < 5; i++){
	for (var j = 0; j < 4; j++){
		gem_icon_draw(i, j);
	}
}
var j = 4;
for (var i = 0; i < 9; i++){
	gem_icon_draw(i, j);
}
for (var i = 4; i < 9; i++){
	for (var j = 5; j < 9; j++){
		gem_icon_draw(i, j);
	}
}

if global.gemAddGem != global.GEM_EMPTY{
	var _animationIndex = (global.upgradeFrame >> 2) & 0b11;
	
	if not global.holdingRight{
		var _leftAdjacentSlot = Vec2(gemAddSlot.x, gemAddSlot.y);
		vec2_subtract(_leftAdjacentSlot, gemAddOrientation);
		if is_inbounds(_leftAdjacentSlot){
			var _xPos = gem_x_pos(_leftAdjacentSlot.x, _leftAdjacentSlot.y);
			var _yPos = gem_y_pos(_leftAdjacentSlot.x, _leftAdjacentSlot.y) - 10;
			var _colour = global.gemGrid[_leftAdjacentSlot.x][_leftAdjacentSlot.y].gem == global.GEM_EMPTY ? #00FFFF : #FF0000;
			draw_sprite_ext(s_iconHighlight, _animationIndex, _xPos, _yPos, 1, 1, 0, _colour, 1);
		}
	}
	
	if not global.holdingLeft{
		var _rightAdjacentSlot = Vec2(gemAddSlot.x, gemAddSlot.y);
		vec2_add(_rightAdjacentSlot, gemAddOrientation);
		if is_inbounds(_rightAdjacentSlot){
			var _xPos = gem_x_pos(_rightAdjacentSlot.x, _rightAdjacentSlot.y);
			var _yPos = gem_y_pos(_rightAdjacentSlot.x, _rightAdjacentSlot.y) - 10;
			var _colour = global.gemGrid[_rightAdjacentSlot.x][_rightAdjacentSlot.y].gem == global.GEM_EMPTY ? #00FFFF : #FF0000;
			draw_sprite_ext(s_iconHighlight, _animationIndex, _xPos, _yPos, 1, 1, 0, _colour, 1);
		}
	}
	
	var _xPos = gem_x_pos(gemAddSlot.x, gemAddSlot.y);
	var _yPos = gem_y_pos(gemAddSlot.x, gemAddSlot.y) - 10 + global.gemAddTick;
	draw_sprite(global.gemGrid[gemAddSlot.x][gemAddSlot.y].gem == global.GEM_EMPTY ? s_iconBase : s_iconBaseReject, global.gemAddTick, _xPos, _yPos);
	draw_sprite_ext(global.gemAddGem.sprite_index, 0, _xPos, _yPos, 1, 1, 0, c_black, 1);
}else{
	if not is_undefined(gemAddSlot){
		var _xPos = gem_x_pos(gemAddSlot.x, gemAddSlot.y);
		var _yPos = gem_y_pos(gemAddSlot.x, gemAddSlot.y);
		draw_sprite(s_iconNext, gemAddOrientation.x == 1 ? 1 : 0, _xPos, _yPos)
	}
}

if not instance_exists(o_player){
	var _xPos = 108 + 34;
	var _yPos = 40;
	draw_text_colour(_xPos + 1, _yPos + 1, "GAME OVER", #FF0000, #FF0000, #FF0000, #FF0000, 1);
	draw_text_colour(_xPos, _yPos, "GAME OVER", c_white, c_white, c_white, c_white, 1);
	for (var i = 0; i <= 20; i += 10){
		draw_text_colour(_xPos + 1 + i, _yPos + 1 + i, "GAME OVER", #FF0000, #FF0000, #FF0000, #FF0000, 1);
		draw_text_colour(_xPos + i, _yPos + i, "GAME OVER", c_white, c_white, c_white, c_white, 1);
		draw_text_colour(_xPos + 1 - i, _yPos + 1 - i, "GAME OVER", #FF0000, #FF0000, #FF0000, #FF0000, 1);
		draw_text_colour(_xPos - i, _yPos - i, "GAME OVER", c_white, c_white, c_white, c_white, 1);
	
	}
	
	_yPos = 168;
	_xPos = 108 + 34 - 18;
	draw_text_colour(_xPos + 1, _yPos + 1, "PRESS [R] TO RESTART", #FF0000, #FF0000, #FF0000, #FF0000, 1);
	draw_text_colour(_xPos, _yPos, "PRESS [R] TO RESTART", c_white, c_white, c_white, c_white, 1);
}

if global.atStart{
	_yPos = 168;
	_xPos = 116;
	draw_text_colour(_xPos + 1, _yPos + 1, "PRESS ANYTHING TO START", #FF0000, #FF0000, #FF0000, #FF0000, 1);
	draw_text_colour(_xPos, _yPos, "PRESS ANYTHING TO START", c_white, c_white, c_white, c_white, 1);
}