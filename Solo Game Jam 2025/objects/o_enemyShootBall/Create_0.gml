if instance_exists(o_player){
	var _dir = point_direction(x, y, o_player.x + 4.5, o_player.y + 3.5);
	xVelocity = lengthdir_x(0.5, _dir);
	yVelocity = lengthdir_y(0.5, _dir);
}else{
	xVelocity = 0;
	yVelocity = 0.5;
}