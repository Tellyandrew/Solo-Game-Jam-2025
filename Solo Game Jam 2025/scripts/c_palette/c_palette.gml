function palette_set_colour(_index, _colour){
	var _arrayIndex = 3*_index;
	global.PALETTE[_arrayIndex + 0] = colour_get_red(_colour)*(1/255);
	global.PALETTE[_arrayIndex + 1] = colour_get_green(_colour)*(1/255);
	global.PALETTE[_arrayIndex + 2] = colour_get_blue(_colour)*(1/255);
}