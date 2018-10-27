cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;

min_movement = 3;
movement_proportion = 25;

xTo = xstart;
yTo = ystart;