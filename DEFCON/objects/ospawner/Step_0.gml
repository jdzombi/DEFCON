timerMax = max((room_speed*10)/global.difficulty,1)*instance_number(oSpawner);
timer--;
nearestPlayer = instance_nearest(x, y, oPlayer);

if(timer<=0 && instance_number(oZombie)<global.enemyCountMax && distance_to_object(nearestPlayer) < global.despawnDistance){
	if (oGame.is_multiplayer && oGame.is_server) {
		instance_create(x+8,y+16,instanceType);
		timer=timerMax;
		var buffer = buffer_create(7, buffer_fixed, 1);
		
		buffer_write(buffer, buffer_u8, DATA.ENEMY_CREATE);
		buffer_write(buffer, buffer_s16, global.difficulty);
		buffer_write(buffer, buffer_s16, x);
		buffer_write(buffer, buffer_s16, y);
		
		//send position to clients
		SendPacketToClients(buffer);

		//delete buffer
		buffer_delete(buffer);
	} else if (!oGame.is_multiplayer) {
		instance_create(x+8,y+16,instanceType);
		timer=timerMax;
	}
}