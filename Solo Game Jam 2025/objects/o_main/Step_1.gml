if keyboard_check_pressed(vk_tab){
	global.upgrading = not global.upgrading;
}

var _holdingLeft = pressing_left();
var _holdingRight = pressing_right();
global.pressedLeft = not global.holdingLeft and _holdingLeft;
global.pressedRight = not global.holdingRight and _holdingRight;
global.holdingLeft = _holdingLeft;
global.holdingRight = _holdingRight;

//
if global.upgrading{
	exit;
}
++global.currentFrame;

if global.currentFrame % 256 == 0{
	instance_create_depth(irandom_range(1, 90), 1, -1000, o_targetDummy);
}