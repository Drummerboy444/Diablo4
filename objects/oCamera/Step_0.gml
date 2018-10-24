//Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

//Update object position
if (distance_to_object(follow) > min_movement) {
	x += (xTo - x) / movement_proportion;
	y += (yTo - y) / movement_proportion;
}

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

//Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);