if global.upgrading{
	exit;
}
if global.currentFrame % 0b111 == 0{
	++y;
}
if y >= 192{
	instance_destroy();
}