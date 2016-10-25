/// sc_shot_preloaded_load(filename)

filename = argument0

var obj = '', inival = '', s = '';

ini_open(filename)


if ini_key_exists('shot', 'name')
    name     = ini_read_string('shot', 'name', '')
if ini_key_exists('shot', 'fullname')
    fullname = ini_read_string('shot', 'fullname', '')

s = 'Loading ' +fullname+ '... '

if ini_key_exists('shot', 'objectIndex') {
    inival = ini_read_string('shot', 'objectIndex', '')
    obj = asset_get_index(inival)
    s += ' (*) Shot '+ inival +' ('+ string(obj) +' , '+ object_get_name(obj) +'); '
    if object_exists(obj) {              
        objIndex = obj
    } else s+=" Doesn't exists!"
}
    
if ini_key_exists('shot', 'spriteIndex') {
    inival = ini_read_string('shot', 'spriteIndex', 'sp_target')
    obj = asset_get_index(inival)
    s+=' (*) Sprite ' +inival+ ' ('+ string(obj) +' , '+ sprite_get_name(obj) +')'
    if sprite_exists(obj) {
        sprite_index = obj
    } else s+=" Doesn't exists!"
}
    
if ini_key_exists('shot', 'moveSpeed')
    moveSpeed  = ini_read_real('shot', 'moveSpeed', 0)
if ini_key_exists('shot', 'damageType')
    damageType = ini_read_real('shot', 'damageType', 0)
if ini_key_exists('shot', 'damage')
    damage     = ini_read_real('shot', 'damage', 0)
if ini_key_exists('shot', 'hitSize')
    hitSize    = ini_read_real('shot', 'hitSize', 0)
if ini_key_exists('shot', 'pierceVal')
    pierceVal  = ini_read_real('shot', 'pierceVal', 0)
if ini_key_exists('shot', 'height')
    height     = ini_read_real('shot', 'height', 0)
        
if ini_key_exists('shot', 'explType') {
    inival = ini_read_string('shot', 'explType', '')
    obj = asset_get_index(inival)
    s+=' (*) Object explosion ' +inival+ ' ('+ string(obj) +' , '+ object_get_name(obj) +')'
    if object_exists(obj) {
        explType = obj
    } else s+=" Doesn't exists!"
}
    
if ini_key_exists('shot', 'explScale')
    explScale  = ini_read_real('shot', 'explScale', 0)
    
if ini_key_exists('shot', 'explSound') {
    inival = ini_read_string('shot', 'explSound', '')
    obj = asset_get_index(inival)
    s+=' (*) Sound ' +inival+ ' ('+ string(obj) +' , '+ sound_get_name(obj) +')'
    if sound_exists(obj) {
        explSound = obj
    } else s+=" Doesn't exists!"
}
show_debug_message(s)    
s=''
    
    
ini_close()
