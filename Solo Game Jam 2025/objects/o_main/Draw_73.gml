draw_sprite_ext(s_1x1, 0, 0, 0, 106, 192, 0, #0000FF, 1);

var _sidePadding = 2;

var _yPos = _sidePadding;
draw_text(_sidePadding, _yPos, "LIVES");

draw_set_halign(fa_right);
draw_text(106 - _sidePadding, _yPos, "SCORE");
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 19, 1, 0, c_white, 1);
draw_sprite_ext(s_1x1, 0, 106 - _sidePadding - 20, _yPos, 19, 1, 0, c_white, 1);
_yPos += 2;
draw_text_colour(106 - _sidePadding, _yPos, "1337", #00FFFF, #00FFFF, #00FFFF, #00FFFF, 1);
for (var i = 0; i < 3; i++){
	draw_sprite(s_player, 0, _sidePadding + i*10, _yPos);
}

draw_set_halign(fa_left);

var _yPos = 120;
draw_text(_sidePadding, _yPos, "CONTROLS WHEN PILOTING");
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 87, 1, 0, c_white, 1);
_yPos += 4;
draw_text(_sidePadding, _yPos, "- Hold [A] to move left\n- Hold [D] to move right\n- Hold [A]+[D] to move up");

_yPos += 26;
draw_text(_sidePadding, _yPos, "CONTROLS WHEN UPGRADING");
_yPos += 6;
draw_sprite_ext(s_1x1, 0, _sidePadding, _yPos, 91, 1, 0, c_white, 1);
_yPos += 4;
draw_text(_sidePadding, _yPos, "- Release [A] to go left\n- Release [D] to go right\n- Hold [A]+[D] to upgrade");

draw_sprite_ext(s_1x1, 0, 105, 0, 1, 192, 0, #FFFFFF, 1);

draw_sprite_ext(s_1x1, 0, 214, 0, 106, 192, 0, #0000FF, 1);

draw_sprite_ext(s_1x1, 0, 214, 0, 1, 192, 0, #FFFFFF, 1);

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

if gemAddGem != global.GEM_EMPTY{
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
	var _yPos = gem_y_pos(gemAddSlot.x, gemAddSlot.y) - 10 + gemAddTick;
	draw_sprite(global.gemGrid[gemAddSlot.x][gemAddSlot.y].gem == global.GEM_EMPTY ? s_iconBase : s_iconBaseReject, gemAddTick, _xPos, _yPos);
	draw_sprite(gemAddGem.sprite_index, 0, _xPos, _yPos);
}else{
	if not is_undefined(gemAddSlot){
		var _xPos = gem_x_pos(gemAddSlot.x, gemAddSlot.y);
		var _yPos = gem_y_pos(gemAddSlot.x, gemAddSlot.y);
		draw_sprite(s_iconNext, gemAddOrientation.x == 1 ? 1 : 0, _xPos, _yPos)
	}
}