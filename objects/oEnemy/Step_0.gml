if (distance_to_point(oPlayer.x, oPlayer.y) < agroRange) {
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
	speed = walkSpeed;
	if (315 < direction || direction <= 45) image_index = 0;
	if (45 < direction && direction <= 135) image_index = 1;
	if (135 < direction && direction <= 225) image_index = 2;
	if (225 < direction && direction <= 315) image_index = 3;
} else {
	speed = 0;
}
