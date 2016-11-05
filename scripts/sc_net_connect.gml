/// sc_net_connect()

show_debug_message("Connecting to "+server_ip+" as "+player_name+"  ...")

socket_id = network_create_socket(network_socket_tcp)

if socket_id >= 0 {
    return network_connect(socket_id, server_ip, port)
} else {
    return -1
}


