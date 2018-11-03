walkSpeed = 5;
agroRange = 200;
image_speed = 0;
initial_x = x;
initial_y = y;
chasing_player = false;
image_index = 3;

// Stats
maxHealth = 4;
currentHealth = maxHealth;

attackCooldown = 40;
currentCooldown = attackCooldown;
attackSpeed = 7;
attackRange = 400;

// Pathfind
path_start(EnemyPatrol2, walkSpeed/2, path_action_reverse, true);