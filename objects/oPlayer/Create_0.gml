// stats
spd = 4;
air_spd = 4;
grav = 0.7;
term_vel = 7;
accel = 0.5;
jump_buffer = 7;
jumps = 1;
jump_frames = 4;
jump_hold_frames = 8;
jump_power = 6;
coyote_frames = 3;
walls = oWall;
wall_slide_spd = 0.5;
heat_scale = 1;
heat_frames = 30;

// vars
x_spd = 0;
y_spd = 0;
move_dir = 0;
ideal_spd = 0;
jump_timer = 0;
jump_hold_timer = 0;
jump_buff_timer = 0;
jump_count = jumps;
coyote_timer = 0;
grounded = true;
on_wall_left = false;
on_wall_right = false;
in_wall_jump = false;
x_scale = 0;
face = 1;
last_x = 0;
last_y = 0;
heat = 0;
heat_timer = 0;
heat_extra = 0;