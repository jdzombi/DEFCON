timerMax = max((room_speed*10)/global.difficulty,1)*instance_number(oSpawner);
timer--;

if(timer<=0 && instance_number(oZombie)<global.enemyCountMax){
	if (oGame.is_multiplayer) {
		instance_create(x,y,instanceType);
		timer=timerMax;
		if (oGame.is_server){
			var buffer = buffer_create(5, buffer_fixed, 1);
		
			buffer_write(buffer, buffer_u8, DATA.ENEMY_CREATE);
			buffer_write(buffer, buffer_s16, global.difficulty);
			buffer_write(buffer, buffer_s16, x);
			buffer_write(buffer, buffer_s16, y);
		
			//send position to clients
			for (var i=0; i<ds_list_size(oGame.clients); i++) {
				var soc = oGame.clients[| i];
				if (soc < 0) continue;
				network_send_packet(soc, buffer, buffer_get_size(buffer));
			}

			//delete buffer
			buffer_delete(buffer);
		}
	} else {
		instance_create(x,y,instanceType);
		timer=timerMax;
	}
}