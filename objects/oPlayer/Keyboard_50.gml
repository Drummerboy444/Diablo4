if(cooldown_fireball == 0){
	cooldown_fireball = max_cooldown_fireball;
	with(instance_create_layer(x,y,"Abilites",oFireball)){
		speed = other.projectileSpeed;
		direction = point_direction(other.x,other.y,mouse_x,mouse_y);
		image_angle = direction;
	}
}