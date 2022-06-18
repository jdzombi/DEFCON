port = 9999;
max_clients = 2;

server = network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);

socket_list = ds_list_create();