if (distance_to_point(oPlayer.x, oPlayer.y) < agroRange) {
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	image_angle = direction;
	speed = walkSpeed;
} else {
	speed = 0;
}
