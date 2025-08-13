function pressing_left(){
	return (keyboard_check(ord("A")) or keyboard_check(vk_left) or keyboard_check(ord("J")) or keyboard_check(vk_lshift) or mouse_check_button(mb_left) or keyboard_check(vk_space) or mouse_check_button(mb_middle));
}

function pressing_right(){
	return (keyboard_check(ord("D")) or keyboard_check(vk_right) or keyboard_check(ord("L")) or keyboard_check(vk_rshift) or mouse_check_button(mb_right) or keyboard_check(vk_space) or mouse_check_button(mb_middle));
}