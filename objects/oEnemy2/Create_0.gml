walkSpeed = 5;
agroRange = 200;
xSpeed = 0;
ySpeed = 0;
image_speed = 0;
chasing_player = false;
angle = 90;
image_index = 3;

// Stats
maxHealth = 4;
currentHealth = maxHealth;

attackCooldown = 40;
currentCooldown = attackCooldown;
attackSpeed = 7;
attackRange = 400;

// Pathfind
mode = 0;
/* mode values:
	0 = patrol
	1 = hunt
	2 = return to path
*/
patrolSpeed = walkSpeed/2;
returnPathPosition = -1;
target = noone;
path_start(EnemyPatrol2, patrolSpeed, path_action_reverse, true);
x = path_get_x(EnemyPatrol2, 0);
y = path_get_y(EnemyPatrol2, 0);

// Face direction
xprevious = x;
yprevious = y;