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
	
		mouseAngle = point_direction(x, y, mouse_x, mouse_y);
		
		//If we wanted to swap to Arrow Keys and WASD
		//xinputDirection = point_direction(0, 0, keyboard_check(vk_right) - keyboard_check(vk_left), keyboard_check(vk_down) - keyboard_check(vk_up));
		//mouseAngle = xinputDirection;
		
		shootCD--;
		if (mouse_check_button(mb_left) && shootCD <= 0 && oGame.playerCurrentLoadout[currentGun,1]>0){
			if (isLocal) {
				oGame.playerCurrentLoadout[currentGun,1] -=1;
				shootCD = shootCDMax;
				shoot(currentGun);
				
				if (oGame.is_multiplayer) {
					var buffer = buffer_create(2, buffer_fixed, 1);
					
					buffer_write(buffer, buffer_u8, DATA.PLAYER_SHOOT);
					buffer_write(buffer, buffer_u8, playerID);
					buffer_write(buffer, buffer_u8, currentGun);
					
					//send to server
					if (!oGame.is_server) {
						network_send_packet(oGame.server, buffer, buffer_get_size(buffer));	
					} else { //send to client
						for (var i=0; i<ds_list_size(oGame.clients); i++){
							var soc = oGame.clients[| i];
							if (soc < 0) {
								network_send_packet(soc, buffer, buffer_get_size(buffer));	
							}
						}
					}
					
					buffer_delete(buffer);
				}
			}
		}

		if (mouse_check_button(mb_right) && meleeCD <= 0){
			meleeCD = meleeCDMax;
			//create hitbox
		}

}

//loadout = primary or secondary (0 or 1)
function shoot(loadout){
	
	//Pull the ID of the gun from the loadout of the player
	tempGunID = oGame.playerCurrentLoadout[loadout,0];
	//Pull the damage for the gun using the ID
	tempDamage = oGame.gunArray[tempGunID,2];
	
	ScreenShake(.5, 15, false, true);
	//TODO Fix Spawn location
	//TODO Change bullet behavior for different guns
	var _inst = instance_create_layer(x, y-15, "bullets", oBullet);
	_inst.damage = tempDamage;
	with (_inst){
		//dir = round(oPlayer.mouseAngle/45)*45;
		dir = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y+14);
		spd = 6;
	}
}

function PlayerStateTransition(){
	
}