// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SendPacketToClients(buffer){
	for (var i=0; i<ds_list_size(oGame.clients); i++) {
		var soc = oGame.clients[| i];
		if (soc < 0) continue;
		network_send_packet(soc, buffer, buffer_get_size(buffer));
	}
}

function MeleeBuffer() {
		if (oGame.is_multiplayer) {
		var buffer = buffer_create(2, buffer_fixed, 1);
					
		buffer_write(buffer, buffer_u8, DATA.PLAYER_MELEE);
		buffer_write(buffer, buffer_u8, playerID);
					
		//send to server
		if (!oGame.is_server) {
			network_send_packet(oGame.server, buffer, buffer_get_size(buffer));	
		} else { //send to client
			SendPacketToClients(buffer);
		}
					
		buffer_delete(buffer);
	}
}