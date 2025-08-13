var _xPos = 106 + x;
var _yPos = y;

draw_sprite(s_player, 0, _xPos, _yPos);
if leftThruster{
	draw_sprite(s_playerJet, 1, _xPos, _yPos);
}
if rightThruster{
	draw_sprite(s_playerJet, 0, _xPos, _yPos);
}