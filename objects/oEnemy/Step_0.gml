// Pathfinding mode behaviour
switch pathMode {
case pathModes.patrol:
	if point_distance(x, y, oPlayer.x, oPlayer.y) <= agroRange {
		//oPlayer within agro range, change to hunt mode
		returnPathPosition = path_position;
		path_end();
		speed = 0;
		pathMode = 1;
	} 
	else {
		angle = point_direction(x, y, xprevious, yprevious);
		xSpeed = lengthdir_x(patrolSpeed, angle);
		ySpeed = lengthdir_y(patrolSpeed, angle);
	}
	break;
case pathModes.chase:
	if point_distance(x, y, oPlayer.x, oPlayer.y) < agroRange {
		angle = point_direction(x, y, oPlayer.x, oPlayer.y);
		xSpeed = lengthdir_x(walkSpeed, angle);
		ySpeed = lengthdir_y(walkSpeed, angle);
		
		// Detection of collision during hunt
		
		// Collision detection with the player and other enemies
		if (place_meeting(x + xSpeed, y, oEnemy) || place_meeting(x + xSpeed, y, oPlayer)) {

			// Set up to account for +ve and -ve xSpeed
			xIndex = floor(abs(xSpeed));
			signXSpeed = sign(xSpeed);
			for (var i = xIndex; i >= 0; i--) {
				if (!(place_meeting(x + (i * signXSpeed), y, oEnemy) || place_meeting(x + (i * signXSpeed), y, oPlayer))) {
					xSpeed = i * signXSpeed;
					break;
				}
				xSpeed = 0;
			}
		}
		if (place_meeting(x, y + ySpeed, oEnemy) || place_meeting(x, y + ySpeed, oPlayer)) {

			// Set up to account for +ve and -ve ySpeed
			yIndex = floor(abs(ySpeed));
			signYSpeed = sign(ySpeed);
			for (var i = yIndex; i >= 0; i--) {
				if (!(place_meeting(x, y + (i * signYSpeed), oEnemy) || place_meeting(x, y + (i * signYSpeed), oPlayer))) {
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
		
		
	}
	else {
		// Return to Path
		speed = 0;
		pathMode = 3; // Do nothing unless find a suitable return path
		var returnx;
		var returny;
		var pathCheckPositions = [returnPathPosition, 0, 0.2, 0.4, 0.6, 0.8, 1];
		var shortestDistance = room_height + room_width;
		for(i=0; i<array_length_1d(pathCheckPositions); i++){
			var checkPosition = pathCheckPositions[i];
			returnx = path_get_x(patrol, checkPosition);
			returny = path_get_y(patrol, checkPosition);
			var currentDistance = point_distance(x, y, returnx, returny);
			if(!collision_line( x, y, returnx, returny, oDirtWall, true, false ) && (currentDistance < shortestDistance)){
				shortestDistance = currentDistance;
				returnPathPosition = checkPosition;
				pathMode = 2;
			}
		}
	}
	break;
case pathModes.pathReturn:
	var returnx = path_get_x(patrol, returnPathPosition);
	var returny = path_get_y(patrol, returnPathPosition);
	// check if enemy is back at path
	if point_distance(x, y, returnx, returny) <= patrolSpeed {
		path_start(patrol, patrolSpeed, path_action_reverse, true);
		path_position = returnPathPosition;
		x = returnx;
		y = returny;
		speed = 0;
		pathMode = 0;
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
			pathMode = 1;
		}
	}
	break;
	
case pathModes.nothing:
	if point_distance(x, y, oPlayer.x, oPlayer.y) <= agroRange {
		//oPlayer within agro range, change to hunt mode
		pathMode = 1;
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