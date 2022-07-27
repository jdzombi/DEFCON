if (is_multiplayer){
	var type = async_load[? "type"];

	//Connected
	if (type == network_type_connect) {
		var socket = async_load[? "socket"];
	
		//Send player info
		var buffer = buffer_create(2, buffer_fixed, 1);
	
		buffer_write(buffer, buffer_u8, DATA.INIT_DATA);
		buffer_write(buffer, buffer_u8, ds_list_size(clients));
	
		network_send_packet(socket, buffer, buffer_get_size(buffer));
		buffer_delete(buffer);
	
		//create player2 instance
		var player2 = instance_create_layer(248, 152, "Instances", oPlayer);
		player2.playerID = ds_list_size(clients);
		player2.isLocal = false
	
		//add to list
		ds_list_add(clients, socket);
	}

	//Data
	else if (type == network_type_data) {
		var buffer = async_load[? "buffer"];
		buffer_seek(buffer, buffer_seek_start, 0);
		var data = buffer_read(buffer, buffer_u8);
	
		//INIT_DATA
		if (data == DATA.INIT_DATA){
			var count = buffer_read(buffer, buffer_u8);
			oPlayer.playerID = count;
		
			//shows other active players on screen
			for (var i=0; i<count; i++) {
				var plr = instance_create_layer(248, 152, "Instances", oPlayer);
				plr.playerID = i;
				plr.isLocal = false;
			}
		}
		//player update
		else if (data == DATA.PLAYER_UPDATE) {
			var pID = buffer_read(buffer, buffer_u8);
		
			with (oPlayer) {
				if (pID == playerID) {
					x = buffer_read(buffer, buffer_s16);
					y = buffer_read(buffer, buffer_s16);
					sprite_index = buffer_read(buffer, buffer_u8);
					image_index = buffer_read(buffer, buffer_u8);
				}
			}
		}
		//player shoot
		else if (data == DATA.PLAYER_SHOOT){
			var pID = buffer_read(buffer, buffer_u8);
			with (oPlayer) {
				if (pID == playerID) {
					shoot(currentGun);
				}
			}
		}
		//spawn enemy
		else if (data == DATA.ENEMY_CREATE) {
			global.difficulty = buffer_read(buffer, buffer_s16);
			var zombieX = buffer_read(buffer, buffer_s16);
			var zombieY = buffer_read(buffer, buffer_s16);
			instance_create(zombieX,zombieY,oZombie);
		}
	}
}