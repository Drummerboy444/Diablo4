if (distance_to_point(oPlayer.x, oPlayer.y) < agroRange) {
	angle = point_direction(x, y, oPlayer.x, oPlayer.y);
	xSpeed = lengthdir_x(walkSpeed, angle);
	ySpeed = lengthdir_y(walkSpeed, angle);
	if (place_meeting(x + xSpeed, y, oEnemy)) {
		xSpeed = 0;
	}
	if (place_meeting(x, y + ySpeed, oEnemy)) {
		ySpeed = 0;
	}
	x += xSpeed;
	y += ySpeed;
	
	if (315 < angle || angle <= 45) image_index = 0;
	else if (45 < angle && angle <= 135) image_index = 1;
	else if (135 < angle && angle <= 225) image_index = 2;
	else if (225 < angle && angle <= 315) image_index = 3;
}
