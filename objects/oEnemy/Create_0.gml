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
returnPathPosition = -1;

// Keyword variables
image_speed = 0;
image_index = 3;

// Pathfind
enum pathModes{
	patrol,
	chase,
	pathReturn,
	nothing
}	
pathMode = pathModes.patrol;