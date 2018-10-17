direction = point_direction(x,y,destination.x,destination.y);

if(point_distance(x,y,destination.x,destination.y)<=walkSpeed){
	speed = 0;
	x = destination.x;
	y = destination.y;
}
else{
	speed = walkSpeed;
}
