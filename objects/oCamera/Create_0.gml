cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);


cam_x = oPlayer.x - cam_width/2;
cam_y = oPlayer.y - cam_height/2 - 80;
ideal_pos = [cam_x, cam_y];

cam_spd = 2;
cam_spd_close = 1;