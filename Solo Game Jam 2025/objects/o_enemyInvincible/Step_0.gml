if global.upgrading{
	exit;
}

y += 1;
if y >= 200{
	instance_destroy();
}

if global.currentFrame & 0b111 == 0{
	image_index++;
}