// player controls
var _i = get_gamepad();
get_controls(_i);

// setting heat
if x_spd == spd || x_spd == -spd {
	if heat_timer < heat_frames {
		heat_timer++;
	} else if heat_timer == heat_frames {
		heat_timer = 0;
		if heat < 6 {
			heat += 1;
		}
	}
} else if heat_timer > 0 {
	heat_timer--;
	if heat_timer == 0 {
		heat_timer = heat_frames-1;
		if heat > 0 {
			heat--;
		}
	}
}

if heat == 5 {
	heat_extra = 0.5;
} else if heat == 6 {
	heat_extra = 1.5;
} else {
	heat_extra = 0;
}
// speed
spd = 4 + (heat/2) + heat_extra;
air_spd = spd;

// saving poisition for point direction
last_y = y;
last_x = x;

// grounded
if y_spd >= 0 && place_meeting(x, y+1, walls) {
	grounded = true;
} else { 
	grounded = false;
}

// face
if x_spd > 0 {
	face = 1;
} else if x_spd < 0 {
	face = -1;
}

// movement
move_dir = right_key - left_key;
if grounded {
	jump_count = jumps;
	ideal_spd = move_dir * spd;
	coyote_timer = coyote_frames;
} else {
	ideal_spd = move_dir * air_spd;
	if jump_count == jumps && coyote_timer > 0{
		coyote_timer--;
	} else if jump_count == jumps && coyote_timer == 0 {
		jump_count = jumps - 1;
	} 
	
	if on_wall_left || on_wall_right {
		jump_count = jumps;
		coyote_timer = coyote_frames + 3;
	}
}

// accel and momentum
if x_spd < ideal_spd {
	x_spd += accel;
	if x_spd > ideal_spd {
		x_spd = ideal_spd;
	}
} else if x_spd > ideal_spd {
	x_spd -= accel;
	if x_spd < ideal_spd {
		x_spd = ideal_spd;
	}
}

// jump
if jump_key && jump_count > 0 {
	jump_buff_timer = jump_buffer;
	jump_count -= 1;
}

if jump_buff_timer > 0 {
	jump_buff_timer = 0;
	jump_timer = jump_frames;
	jump_hold_timer = jump_hold_frames;
} else if jump_buff_timer > 0 && grounded == false {
	jump_buff_timer--;
}

if jump_timer > 0 {
	y_spd = -jump_power;
	jump_timer--;
	if jump_hold_timer > 0 && jump_hold_key {
		jump_hold_timer--;
		jump_timer++;
	} else {
		jump_hold_timer = 0;
	}
	
	if on_wall_left == true && jump_key && !grounded{
		x_scale = spd / 1.5;
	} else if on_wall_right == true && jump_key && !grounded{
		x_scale = -spd / 1.5;
	}
	x_spd = x_scale;
} else {
	x_scale = x_spd;
}

// gravity
y_spd += grav;
if y_spd > term_vel {
	y_spd = term_vel;
}

// y collision
var _sub_pixel = 0.5;
if place_meeting(x, y + y_spd, walls) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, walls) {
		y += _pixel_check;
	}
	y_spd = 0;
}

y += y_spd;

// x collision
if place_meeting(x + x_spd, y, walls) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	while !place_meeting(x + _pixel_check, y, walls) {
		x += _pixel_check;
	}
	if x_spd > 0 {
		on_wall_right = true;
	} else if x_spd < 0 {
		on_wall_left = true;
	}
	x_spd = 0;
	if y_spd > 0 {
		y_spd = wall_slide_spd;
	}
	jump_count = jumps;
	
} else {
	on_wall_left = false;
	on_wall_right = false;
}

x += x_spd;
