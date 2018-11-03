if (talking) {
	talking = false;
} else if (point_distance(x,y,oPlayer.x,oPlayer.y) <= interactionRange) {
	talking = true;
}