direction = point_direction(x,y,destination.x,destination.y);
if (point_distance(x, y, destination.x, destination.y) > 0) {
	if (315 < direction || direction <= 45) image_index = 0;
	if (45 < direction && direction <= 135) image_index = 1;
	if (135 < direction && direction <= 225) image_index = 2;
	if (225 < direction && direction <= 315) image_index = 3;
}

if(point_distance(x,y,destination.x,destination.y)<=walkSpeed){
	speed = 0;
	x = destination.x;
	y = destination.y;
}
else{
	speed = walkSpeed;
}
// Comment from Nick