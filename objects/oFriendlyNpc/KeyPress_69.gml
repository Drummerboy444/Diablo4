if (talking) {
	talking = false;
} else if (distance_to_object(oPlayer) <= interactionRange) {
	talking = true;
}