if (x != xprevious || y != yprevious) {
	if (315 < angle || angle <= 45) image_index = 2;
	else if (45 < angle && angle <= 135) image_index = 3;
	else if (135 < angle && angle <= 225) image_index = 0;
	else if (225 < angle && angle <= 315) image_index = 1;
}