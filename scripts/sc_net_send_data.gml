/// sc_send_data(net_id, buf | val1 [, val2, valN])

var _net_id = argument[0]

if buffer_exists(argument[1]) {
    var _buf = argument[1]
    network_send_packet(_net_id, _buf, buffer_tell(_buf))
} else {
    var _buf = buffer_create(128, buffer_grow, 1)
    var ok = true
    for (var i=1; i<argument_count; i++) {
       var _v = argument[i]
       if is_real(_v) {
           buffer_write(_buf, buffer_s32, _v)
       } else
       if is_string(_v) {
           buffer_write(_buf, buffer_string, _v)
       } else {
           // error! unsupported data!
           show_debug_message("!  Tried to send unsupported data  !")
           ok = false
           break
       }
    }
    if ok {
        network_send_packet(_net_id, _buf, buffer_tell(_buf))
        buffer_delete(_buf)
    }    

}
