if(cooldown_aoe == 0){
	instance_create_layer(x,y,"Abilities",oAoe);
	cooldown_aoe = max_cooldown_aoe;
}