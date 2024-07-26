// controls
function get_controls(_i){
	
	// basic movement
	left_key = keyboard_check(vk_left) 
	|| keyboard_check(ord("A")) 
	|| (gamepad_axis_value(_i, gp_axislh) < 0);
	
	right_key = keyboard_check(vk_right) 
	|| keyboard_check(ord("D")) 
	|| (gamepad_axis_value(_i, gp_axislh) > 0);
	
	crouch_key = keyboard_check(vk_down) 
	|| keyboard_check(ord("S")) 
	|| (gamepad_axis_value(_i, gp_axislh) < 0);
	
	jump_key = keyboard_check_pressed(vk_up) 
	|| keyboard_check_pressed(ord("W")) 
	|| keyboard_check_pressed(vk_space)
	|| gamepad_button_check_pressed(_i, gp_face1);
	
	jump_hold_key = keyboard_check(vk_up) 
	|| keyboard_check(ord("W")) 
	|| keyboard_check(vk_space)
	|| gamepad_button_check(_i, gp_face1);
	
}

// getting gamepad
function get_gamepad() {
	gamepad = 0;
	for (i=0;i<12; i++) {
		if gamepad_is_connected(i) == true {
			gamepad = i;
			break;
		}
	}
	
	gamepad_set_axis_deadzone(gamepad, 0.3);
	
	return gamepad;
}