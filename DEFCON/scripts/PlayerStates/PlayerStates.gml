function PlayerStateFree() {
	movementBehavior = MOVEMENT_BEHAVIOR.CHECK_CONTINUALLY;
	//Movement
	hSpeed = (inputKeyDirectionRight - inputKeyDirectionLeft) * speedWalk;
	vSpeed = (inputKeyDirectionDown - inputKeyDirectionUp) * speedWalk;

	PlayerCollision();

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0) {
		direction = inputDirection;
		sprite_index = spriteWalk;
	}
	else {
		sprite_index = spriteIdle;
	}

	if (_oldSprite != sprite_index) {
		localFrame = 0;	
	}

	//Update Image Index
	AnimatePlayer(playback);
	
	//TODO Add entities to press E on (door, item, etc)
	/*
	//Activate Key Logic
	if (inputKeyButtonA) {
		//1.) Check for an entity to activate	
		//2.) If there is nothing, or the object has no script. - do nothing
		//3.) Otherwise, if there is something and it has a script. - Activate!
		//4.) If the thing we activate is an NPC. - Make it face towards us.
	
		var _activateX = lengthdir_x(10, direction);
		var _activateY = lengthdir_y(10, direction);
		activate = instance_position(x + _activateX, y + _activateY, pEntity);
	
		if ((activate == noone) || (activate.entityActivateScript == -1)) {
		}
		else {
			//Activate the Entity
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			//Make an NPC face the player
			if (activate.entityNPC) {
				with (activate) {
					direction = point_direction(x, y, other.x, other.y);	
					var _frameCount = sprite_get_number(sprite_index);
					image_index = (CARDINAL_DIR * (_frameCount / 8) + 1);
					if (image_index > _frameCount) {
						image_index -= _frameCount;
					}
				}
			}
		}

	}
	*/
}
