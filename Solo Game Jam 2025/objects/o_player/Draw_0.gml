var _xPos = 106 + x;
var _yPos = y;

if iFrames <= 0 or (iFrames & 0b111 <= 0b11){
	draw_sprite(s_player, 0, _xPos, _yPos);
	if leftThruster{
		draw_sprite(s_playerJet, 1, _xPos, _yPos);
	}
	if rightThruster{
		draw_sprite(s_playerJet, 0, _xPos, _yPos);
	}
}