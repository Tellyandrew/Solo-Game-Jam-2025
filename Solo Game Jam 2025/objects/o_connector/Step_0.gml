if global.upgrading{
	exit;
}
var _speed = 0b111;
if global.currentFrame & _speed == 0{
	++y;
}
if y >= 192{
	instance_destroy();
}