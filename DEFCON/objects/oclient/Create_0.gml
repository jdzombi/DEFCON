port = 9999;
ip = "127.0.0.1";

network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(network_socket_tcp);
connection = network_connect(client, ip, port);



client_buffer = buffer_create(1024,buffer_fixed,1);

/*
//create player 2
instances = ds_map_create();
Player = instance_create_layer(300, 152, "Instances", oPlayer);
playerID = Player.myID;

ds_map_add(instances, playerID, Player);
*/