if global.upgrading{
	exit;
}

x += xVelocity;
y += yVelocity;

if x < -8 or x > 116 or y > 200 or y < -8{
	instance_destroy();
}