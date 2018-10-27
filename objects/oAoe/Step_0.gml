x = sPlayer.x;
y = sPlayer.y;
lifetime -= 1;
image_alpha = image_alpha * (lifetime/maxLifetime);
if (lifetime <= 0){
	instance_destroy();
}