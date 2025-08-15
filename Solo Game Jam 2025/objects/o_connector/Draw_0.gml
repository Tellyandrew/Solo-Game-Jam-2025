for (var _xPos = left; _xPos < right; _xPos += 4){
	draw_sprite(s_upgradeLine, (global.currentFrame >> 3) & 0b11, _xPos + 106, y + 10);
}
draw_sprite(sprite_index, y < 0 ? 0 : 1, x + 106, y);