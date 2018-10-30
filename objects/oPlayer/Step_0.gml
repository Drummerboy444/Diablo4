angle = point_direction(x, y, oDestination.x, oDestination.y);
xSpeed = lengthdir_x(walkSpeed, angle);
ySpeed = lengthdir_y(walkSpeed, angle);

// Collision detection with enemies
if (place_meeting(x + xSpeed, y, oEnemy)) {

	// Set up to account for +ve and -ve xSpeed
	xIndex = floor(abs(xSpeed));
	signXSpeed = sign(xSpeed);
	for (var i = xIndex; i >= 0; i--) {
		if (!(place_meeting(x + (i * signXSpeed), y, oEnemy))) {
			xSpeed = i * signXSpeed;
			break;
		}
		xSpeed = 0;
	}
}
if (place_meeting(x, y + ySpeed, oEnemy)) {

	// Set up to account for +ve and -ve ySpeed
	yIndex = floor(abs(ySpeed));
	signYSpeed = sign(ySpeed);
	for (var i = yIndex; i >= 0; i--) {
		if (!(place_meeting(x, y + (i * signYSpeed), oEnemy))) {
			ySpeed = i * signYSpeed;
			break;
		}
		ySpeed = 0;
	}
}

// Collision detection with the player and walls
if (place_meeting(x + xSpeed, y, oDirtWall)) {
	xSpeed = 0;
}
if (place_meeting(x, y + ySpeed, oDirtWall)) {
	ySpeed = 0;
}

// Movement
// Moves the player to the destination if it's close enough
remaining_dist = point_distance(x,y,oDestination.x,oDestination.y);
if(remaining_dist <= walkSpeed*10){
	xSpeed = xSpeed * remaining_dist / (walkSpeed*10);
	ySpeed = ySpeed * remaining_dist / (walkSpeed*10);
}
x += xSpeed;
y += ySpeed;

// Change the sprite to face the direction of movement if the player is trying to move
if (point_distance(x, y, oDestination.x, oDestination.y) > 0) {
	if (315 < angle || angle <= 45) image_index = 0;
	else if (45 < angle && angle <= 135) image_index = 1;
	else if (135 < angle && angle <= 225) image_index = 2;
	else if (225 < angle && angle <= 315) image_index = 3;
}