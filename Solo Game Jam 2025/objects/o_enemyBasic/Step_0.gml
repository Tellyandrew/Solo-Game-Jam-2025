if global.upgrading{
	exit;
}

var _speed = rushTick > 0 ? 0b1 : 0b111;

if global.currentFrame & _speed == 0{
	y++;
	--rushTick;
	if y >= 200{
		instance_destroy();
	}
}

if global.currentFrame & 0b111 == 0{
	image_index++;
}