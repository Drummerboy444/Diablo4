if (distance_to_point(oPlayer.x, oPlayer.y) < agroRange) {
	angle = point_direction(x, y, oPlayer.x, oPlayer.y);
	chasing_player = true;
}
else{
	angle = point_direction(x, y, initial_x, initial_y);
	chasing_player = false;
}
xSpeed = lengthdir_x(walkSpeed, angle);
ySpeed = lengthdir_y(walkSpeed, angle);

// Collision detection with the player and other enemies
if (place_meeting(x + xSpeed, y, oEnemy) || place_meeting(x + xSpeed, y, oPlayer)) {

	// Set up to account for +ve and -ve xSpeed
	xIndex = floor(abs(xSpeed));
	signXSpeed = sign(xSpeed);
	for (var i = xIndex; i >= 0; i--) {
		if (!(place_meeting(x + (i * signXSpeed), y, oEnemy) || place_meeting(x + (i * signXSpeed), y, oPlayer))) {
			xSpeed = i * signXSpeed;
			break;
		}
		xSpeed = 0;
	}
}
if (place_meeting(x, y + ySpeed, oEnemy) || place_meeting(x, y + ySpeed, oPlayer)) {

	// Set up to account for +ve and -ve ySpeed
	yIndex = floor(abs(ySpeed));
	signYSpeed = sign(ySpeed);
	for (var i = yIndex; i >= 0; i--) {
		if (!(place_meeting(x, y + (i * signYSpeed), oEnemy) || place_meeting(x, y + (i * signYSpeed), oPlayer))) {
			ySpeed = i * signYSpeed;
			break;
		}
		ySpeed = 0;
	}
}

// Snap to initial position
if(distance_to_point(initial_x, initial_y) < walkSpeed/2 and chasing_player==false){
	if(!place_meeting(initial_x,initial_y,oPlayer) && place_meeting(initial_x,initial_y,oEnemy)){
		x = initial_x;
		y = initial_y;
	}
	xSpeed = 0;
	ySpeed = 0;
	image_index = 3;
}

// Movement
x += xSpeed;
y += ySpeed;

// Change the sprite to face the direction of movement
if (xSpeed !=0 or ySpeed !=0){
	if (315 < angle || angle <= 45) image_index = 0;
	else if (45 < angle && angle <= 135) image_index = 1;
	else if (135 < angle && angle <= 225) image_index = 2;
	else if (225 < angle && angle <= 315) image_index = 3;
}
