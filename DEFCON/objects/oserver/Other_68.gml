type_event = ds_map_find_value(async_load, "type");

switch(type_event){
	case network_type_connect:
	socket = ds_map_find_value(async_load, "socket");
	ds_list_add(socket_list, socket); //add client to socket list while connecting
	break;
	
	case network_type_disconnect:
	socket = ds_map_find_value(async_load, "socket");
	ds_list_remove(socket_list, socket); //remove client from socket list while disconnecting
	break;
	
	case network_type_data:
	buffer = ds_map_find_value(async_load, "buffer"); //add data to buffer
	socket = ds_map_find_value(async_load, "id");	//determine client who sent data
	buffer_seek(buffer, buffer_seek_start, 0);
	received_packet(buffer, socket);
	break;
}