var health_t_l = [50,50];
var health_b_r = [200,60];

currentHealth = 50;
maxHealth = 200;

var healthRight = health_t_l[0] + (health_b_r[0]-health_t_l[0]) * currentHealth/maxHealth;

// Health bar background
draw_set_colour($333333);
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