if global.upgrading{
	exit;
}

if image == 3{
	instance_destroy();
}

image_index = floor(image);



image += 0.25;