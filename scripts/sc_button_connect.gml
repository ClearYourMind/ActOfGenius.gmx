/// sc_button_connect()

server_ip   = sc_gui_find_by_name("tx_ip").caption
player_name = sc_gui_find_by_name("tx_nick").caption

sc_net_connect()

room_goto_next()

