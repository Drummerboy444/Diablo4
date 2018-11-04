other.currentHealth -= 1;
collided = true;
instance_create_layer(other.x,(y + other.y)/2,"Abilities",oExplosion);

audio_pause_sound(sndFireball);