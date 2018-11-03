// Make a list of patrols
patrols = [
	EnemyPatrol1,
	EnemyPatrol2,
	EnemyPatrol3,
	EnemyPatrol4
];

// Spawn one enemy on each patrol
for(i=0; i<array_length_1d(patrols); i++){
	patrol = patrols[i];
	with(instance_create_layer(x,y,"Enemies",oEnemy)){
		patrol = other.patrol;
		path_start(patrol, patrolSpeed, path_action_reverse, true);
		x = path_get_x(patrol, 0);
		y = path_get_y(patrol, 0);
	}
}