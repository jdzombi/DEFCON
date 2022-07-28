// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SendPacketToClients(buffer){
	for (var i=0; i<ds_list_size(oGame.clients); i++) {
		var soc = oGame.clients[| i];
		if (soc < 0) continue;
		network_send_packet(soc, buffer, buffer_get_size(buffer));
	}
}