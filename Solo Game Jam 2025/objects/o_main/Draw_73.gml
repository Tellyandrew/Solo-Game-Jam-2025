draw_sprite_ext(s_1x1, 0, 0, 0, 106, 192, 0, #0000FF, 1);

var _yPos = 2;
draw_text(2, _yPos, "CONTROLS WHEN PILOTING");
_yPos += 6;
draw_sprite_ext(s_1x1, 2, 2, _yPos, 87, 1, 0, c_white, 1);
_yPos += 4;
draw_text(2, _yPos, "- Hold [A] to move left\n- Hold [D] to move right\n- Hold [A]+[D] to move up");

var _yPos = 38;
draw_text(2, _yPos, "CONTROLS WHEN UPGRADING");
_yPos += 6;
draw_sprite_ext(s_1x1, 2, 2, _yPos, 91, 1, 0, c_white, 1);
_yPos += 4;
draw_text(2, _yPos, "- Release [A] to go left\n- Release [D] to go right\n- Hold [A]+[D] to upgrade");

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

var _xPos = gem_x_pos(4, 4);
var _yPos = gem_y_pos(4, 4) - 10;
draw_sprite(s_iconBase, 0, _xPos, _yPos);
draw_sprite(s_iconGunLeft, 0, _xPos, _yPos);