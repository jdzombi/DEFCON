event_inherited()

if(invincibilityTimer>0) invincibilityTimer--;

//Update Arm object
	if(sprite_index == spriteWalk){
		armSpriteIndex = armSpriteWalk;
	} else {
		armSpriteIndex = armSpriteIdle;
	}
	

if(state == PlayerStateFree){
	armID.image_speed = 0;
	armID.image_index = image_index;
}

inputDirection = point_direction(0, 0, inputKeyDirectionRight - inputKeyDirectionLeft, inputKeyDirectionDown - inputKeyDirectionUp);
inputMagnitude = (inputKeyDirectionRight - inputKeyDirectionLeft != 0) || (inputKeyDirectionDown - inputKeyDirectionUp != 0);

if !(global.gamePaused) { script_execute(state); }

depth = -bbox_bottom;

//create buffer to send coord data to other player
if (!isLocal) exit; //dont put anything below this otherwise it will exit for client
if (oGame.is_multiplayer){
	var buffer = buffer_create(8, buffer_fixed, 1);
		
	buffer_write(buffer, buffer_u8, DATA.PLAYER_UPDATE);
	buffer_write(buffer, buffer_u8, playerID);
	buffer_write(buffer, buffer_s16, x);
	buffer_write(buffer, buffer_s16, y);
	buffer_write(buffer, buffer_u8, sprite_index);
	buffer_write(buffer, buffer_u8, image_index);
		
	//send position to server
	if (!oGame.is_server) {
		network_send_packet(oGame.server, buffer, buffer_get_size(buffer));
	}
	//send position to clients
	else {
		SendPacketToClients(buffer);
	}

	//delete buffer
	buffer_delete(buffer);
}