if (point_distance(x,y,oPlayer.x,oPlayer.y) > interactionRange) {
	talking = false;
	beckoning = false;
}
else if (beckoning==false){
	beckoning = true;
	with(instance_create_layer(x,y-32,"NonPlayerCharacters",oChatMarker)){
		interactionRange = other.interactionRange; 
	}
}