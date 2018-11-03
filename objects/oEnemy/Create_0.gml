// Adjustable variables
maxHealth = 4;
currentHealth = maxHealth;
attackCooldown = 40;
currentCooldown = attackCooldown;
attackSpeed = 7;
attackRange = 400;
walkSpeed = 5;
patrolSpeed = 3;
agroRange = 200;

// Engine variables
xSpeed = 0;
ySpeed = 0;
angle = 90;
chasing_player = false;
returnPathPosition = -1;
target = noone;

// Keyword variables
image_speed = 0;
image_index = 3;

// Pathfind
pathMode = 0;
/* mode values:
	0 = patrol
	1 = hunt
	2 = return to path
*/