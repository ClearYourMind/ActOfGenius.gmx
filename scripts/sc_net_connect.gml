/// sc_net_connect()

show_debug_message("Connecting to "+server_ip+" as "+player_name+"  ...")

socket_id = network_create_socket(network_socket_tcp)
network_connect(socket_id, server_ip, port)


