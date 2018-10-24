if(cooldown_2 == 0){
	cooldown_2 = max_cooldown_2;
	with(instance_create_layer(x,y,"Abilites",oArrow)){
		speed = other.projectileSpeed;
		direction = point_direction(other.x,other.y,mouse_x,mouse_y);
		image_angle = direction;
	}
}