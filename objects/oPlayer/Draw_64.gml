draw_set_alpha(0.3);
draw_set_colour($000000);
draw_rectangle(38,38,212,114,false);
draw_rectangle(40,40,210,112,false);
draw_set_alpha(1);

var health_t_l = [50,50];
var health_b_r = [200,60];

var healthRight = health_t_l[0] + (health_b_r[0]-health_t_l[0]) * currentHealth/maxHealth;

// Health bar background
draw_set_colour($555555);
draw_rectangle(	
	health_t_l[0]-2,
	health_t_l[1]-2,
	health_b_r[0]+2,
	health_b_r[1]+2,
	false);
// Health bar full bar
draw_set_colour($2222aa);
draw_rectangle(	
	health_t_l[0],
	health_t_l[1],
	health_b_r[0],
	health_b_r[1],
	false);
// Health bar tracker bar
draw_set_colour($22aa22);
draw_rectangle(	
	health_t_l[0],
	health_t_l[1],
	healthRight,
	health_b_r[1],
	false);
	
draw_set_colour($000000);

draw_sprite(sFireballIcon,-1,50,70);
var top = 102 - 32 * (cooldown_fireball/max_cooldown_fireball);
draw_set_alpha(0.5);
draw_rectangle(50,top,82,102,false);

draw_set_alpha(1);
draw_sprite(sAoeIcon,-1,90,70);
var top = 102 - 32 * (cooldown_aoe/max_cooldown_aoe);
draw_set_alpha(0.5);
draw_rectangle(90,top,122,102,false);
draw_set_alpha(1);