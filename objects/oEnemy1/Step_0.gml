// Pathfinding mode behaviour
switch mode {
case 0:
	// check for oPlayer
	if point_distance(x, y, oPlayer.x, oPlayer.y) <= agroRange {
		//oPlayer within agro range, change to hunt mode
		returnPathPosition = path_position;
		path_end();
		speed = 0;
		mode = 1;
	} else {
			angle = point_direction(x, y, xprevious, yprevious);
			xSpeed = lengthdir_x(patrolSpeed, angle);
			ySpeed = lengthdir_y(patrolSpeed, angle);
	}
	break;
case 1:
	// hunt oPlayer
	if point_distance(x, y, oPlayer.x, oPlayer.y) < agroRange {
		angle = point_direction(x, y, oPlayer.x, oPlayer.y);
		xSpeed = lengthdir_x(walkSpeed, angle);
		ySpeed = lengthdir_y(walkSpeed, angle);
		
		// Detection of collision during hunt
		
		// Collision detection with the player and enemy2
		if (place_meeting(x + xSpeed, y, oEnemy2) || place_meeting(x + xSpeed, y, oPlayer)) {

			// Set up to account for +ve and -ve xSpeed
			xIndex = floor(abs(xSpeed));
			signXSpeed = sign(xSpeed);
			for (var i = xIndex; i >= 0; i--) {
				if (!(place_meeting(x + (i * signXSpeed), y, oEnemy2) || place_meeting(x + (i * signXSpeed), y, oPlayer))) {
					xSpeed = i * signXSpeed;
					break;
				}
				xSpeed = 0;
			}
		}
		if (place_meeting(x, y + ySpeed, oEnemy2) || place_meeting(x, y + ySpeed, oPlayer)) {

			// Set up to account for +ve and -ve ySpeed
			yIndex = floor(abs(ySpeed));
			signYSpeed = sign(ySpeed);
			for (var i = yIndex; i >= 0; i--) {
				if (!(place_meeting(x, y + (i * signYSpeed), oEnemy2) || place_meeting(x, y + (i * signYSpeed), oPlayer))) {
					ySpeed = i * signYSpeed;
					break;
				}
				xSpeed = 0;
			}
		}

		// Collision detection with the Enemy and walls
		if (place_meeting(x + xSpeed, y, oDirtWall)) {
			xSpeed = 0;
		}
		if (place_meeting(x, y + ySpeed, oDirtWall)) {
			ySpeed = 0;
		}
		
		// movement towards oPlayer
		x += xSpeed;
		y += ySpeed;
		
	// Back to mode 1	
	} else {
			// Player lost
			speed = 0;
			mode = 2;
	}
	break;
case 2:
	// Return to path
	var returnx = path_get_x(EnemyPatrol1, returnPathPosition);
	var returny = path_get_y(EnemyPatrol1, returnPathPosition);
	// check if enemy is back at path
	if point_distance(x, y, returnx, returny) <= patrolSpeed {
		path_start(EnemyPatrol1, patrolSpeed, path_action_reverse, true);
		path_position = returnPathPosition;
		x = returnx;
		y = returny;
		speed = 0;
		mode = 0;
	} else {
		// need to travel back to path
		angle = point_direction(x, y, returnx, returny);
		xSpeed = lengthdir_x(walkSpeed, angle);
		ySpeed = lengthdir_y(walkSpeed, angle);
		x += xSpeed;
		y += ySpeed;
		// keep checking for oPlayer
		if point_distance(x, y, oPlayer.x, oPlayer.y) <= agroRange {
			speed = 0;
			mode = 1;
		}
	}
	break;
}

// Attack player if they're within range and the cooldown is off
if (currentCooldown <= 0 && distance_to_object(oPlayer) <= attackRange) {
	with (instance_create_layer(other.x, other.y, "Abilities", oArrow)) {
		direction = point_direction(x, y, oPlayer.x, oPlayer.y);
		image_angle = direction;
		speed = other.attackSpeed;
	}
	currentCooldown = attackCooldown;
}
currentCooldown = max(0, currentCooldown - 1);