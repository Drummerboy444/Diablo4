angle = point_direction(x, y, destination.x, destination.y);
xSpeed = lengthdir_x(walkSpeed, angle);
ySpeed = lengthdir_y(walkSpeed, angle);

// Collision detection with enemies
if (place_meeting(x + xSpeed, y, oEnemy)) {
	xSpeed = 0;
}
if (place_meeting(x, y + ySpeed, oEnemy)) {
	ySpeed = 0;
}

// Movement
// Moves the player to the destination if it's close enough
if(point_distance(x,y,destination.x,destination.y)<=walkSpeed){
	if (xSpeed > 0) {
		x = destination.x;
	}
	if (ySpeed > 0) {
		y = destination.y;
	}
}
else{
	x += xSpeed;
	y += ySpeed;
}

// Change the sprite to face the direction of movement if the player is trying to move
if (point_distance(x, y, destination.x, destination.y) > 0) {
	if (315 < angle || angle <= 45) image_index = 0;
	else if (45 < angle && angle <= 135) image_index = 1;
	else if (135 < angle && angle <= 225) image_index = 2;
	else if (225 < angle && angle <= 315) image_index = 3;
}