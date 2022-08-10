//Menu inputs
if (room == rMenu){
	//host
	if (keyboard_check_pressed(vk_space)) {
		is_multiplayer = true;
		server = network_create_server(network_socket_tcp, server_port, 2);
		
		//failed
		if (server < 0) {
			show_error("Could not create server.", false);
		} else {
			room_goto(rTest2);
			is_server = true;
		}
	}
	
	//join
	else if (keyboard_check_pressed(vk_enter)){
		is_multiplayer = true;
		server = network_create_socket(network_socket_tcp);
		var res = network_connect(server, server_ip, server_port);
		
		//failed
		if (res < 0) {
			show_error("Could not connect.", false);
		} else {
			room_goto(rTest2);
		}
	} else if (keyboard_check_pressed(vk_tab)) {
		is_multiplayer = false;
		room_goto(rTest2);	
	}
}

show_debug_message(instance_number(oHurtbox));