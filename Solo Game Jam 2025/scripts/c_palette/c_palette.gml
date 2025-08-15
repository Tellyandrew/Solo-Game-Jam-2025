function palette_set_colour(_index, _colour){
	var _arrayIndex = 3*_index;
	global.PALETTE[_arrayIndex + 0] = colour_get_red(_colour)*(1/255);
	global.PALETTE[_arrayIndex + 1] = colour_get_green(_colour)*(1/255);
	global.PALETTE[_arrayIndex + 2] = colour_get_blue(_colour)*(1/255);
}

function palette_get_colour(_index){
	var _arrayIndex = 3*_index;
	var _red = global.PALETTE[_arrayIndex + 0]*255;
	var _green = global.PALETTE[_arrayIndex + 1]*255;
	var _blue = global.PALETTE[_arrayIndex + 2]*255;
	
	return make_colour_rgb(_red, _green, _blue);
}