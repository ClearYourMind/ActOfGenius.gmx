/// sc_unit_preloaded_load(filename)

filename = argument0

loadedOk = true

ini_open(filename)

/// Create unit parts from file

var inisect = '', inival = '', i = 0, obj = noone, s = '';

if ini_key_exists('unit', 'name')
    name = ini_read_string('unit', 'name', '')
if ini_key_exists('unit', 'fullname')
    fullname = ini_read_string('unit', 'fullname', '')
if ini_key_exists('unit', 'height')
    height     = ini_read_real('unit', 'height', -1)

if ini_key_exists('unit', 'explType') {
    inival = ini_read_string('unit', 'explType', '')
    obj = asset_get_index(inival)
    s+='... (*) Object explosion ' +inival+ ' ('+ string(obj) +' , '+ object_get_name(obj) +')'
    if object_exists(obj) {
        explType = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}
    
if ini_key_exists('unit', 'explScale')
    explScale  = ini_read_real('unit', 'explScale', 0)
    
if ini_key_exists('unit', 'explSound') {
    inival = ini_read_string('unit', 'explSound', '')
    obj = asset_get_index(inival)
    s+='... (*) Sound ' +inival+ ' ('+ string(obj) +' , '+ sound_get_name(obj) +')'
    if sound_exists(obj) {
        explSound = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}

if ini_key_exists('unit', 'shieldValue')
    shieldValue = ini_read_real('unit', 'shieldValue', 0)
if ini_key_exists('unit', 'health')
    objHealth   = ini_read_real('unit', 'health', 0)
if ini_key_exists('unit', 'sightDist')
    sightDist  = ini_read_real('unit', 'sightDist', 0)
if ini_key_exists('unit', 'retreatDist')
    retreatDist = ini_read_real('unit', 'retreatDist', 0)

//reading script assets
if ini_key_exists('unit', 'aiMainScript') {
    inival = ini_read_string('unit', 'aiMainScript', '')
    obj = asset_get_index(inival)        // doesn't work on HTML 5
    s+='... (*) Script ' +inival+ ' ('+ string(obj) +' , '+ script_get_name(obj) +')'
    if script_exists(obj) {
       aiMainScript = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}
if ini_key_exists('unit', 'scIdle') {
    inival = ini_read_string('unit', 'scIdle', '')
    obj = asset_get_index(inival)        // doesn't work on HTML 5
    s+='... (*) Script ' +inival+ ' ('+ string(obj) +' , '+ script_get_name(obj) +')'
    if script_exists(obj) {
       scIdle = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}
if ini_key_exists('unit', 'scFindTarget') {
    inival = ini_read_string('unit', 'scFindTarget', '')
    obj = asset_get_index(inival)        // doesn't work on HTML 5
    s+='... (*) Script ' +inival+ ' ('+ string(obj) +' , '+ script_get_name(obj) +')'
    if script_exists(obj) {
       scFindTarget = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}
if ini_key_exists('unit', 'scTargetFound') {
    inival = ini_read_string('unit', 'scTargetFound', '')
    obj = asset_get_index(inival)        // doesn't work on HTML 5
    s+='... (*) Script ' +inival+ ' ('+ string(obj) +' , '+ script_get_name(obj) +')'
    if script_exists(obj) {
       scTargetFound = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}
if ini_key_exists('unit', 'scFollowTarget') {
    inival = ini_read_string('unit', 'scFollowTarget', '')
    obj = asset_get_index(inival)        // doesn't work on HTML 5
    s+='... (*) Script ' +inival+ ' ('+ string(obj) +' , '+ script_get_name(obj) +')'
    if script_exists(obj) {
       scFollowTarget = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}
if ini_key_exists('unit', 'scDestroyTarget') {
    inival = ini_read_string('unit', 'scDestroyTarget', '')
    obj = asset_get_index(inival)        // doesn't work on HTML 5
    s+='... (*) Script ' +inival+ ' ('+ string(obj) +' , '+ script_get_name(obj) +')'
    if script_exists(obj) {
       scDestroyTarget = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}
if ini_key_exists('unit', 'scTakeDamage') {
    inival = ini_read_string('unit', 'scTakeDamage', '')
    obj = asset_get_index(inival)        // doesn't work on HTML 5
    s+='... (*) Script ' +inival+ ' ('+ string(obj) +' , '+ script_get_name(obj) +')'
    if script_exists(obj) {
       scTakeDamage = obj
    } else {
        // error during load
        loadedOk = false
        s+=" Doesn't exists!"
    }
}

show_debug_message(s)    
s=''


// reading parts
do {
    i++
    inisect = 'part'+string(i)
    if ini_section_exists(inisect) {
        s = 'Reading ' +inisect+ '... '
        
        if ini_key_exists(inisect, 'objectIndex') {
            inival = ini_read_string(inisect, 'objectIndex', '')
            obj = asset_get_index(inival)
            s += '... (*) Object '+ inival +' ('+ string(obj) +' , '+ object_get_name(obj) +'); '
            if object_exists(obj) {              // part is created only if object is assigned
                partcount++
                parts[partcount-1] = instance_create(x, y, obj)  
                parts[partcount-1].visible = false  
            } else  {
              // if accociated object for part not found reading stops!
              s+="Doesn't exists! Reading stopped!"
              loadedOk = false
              break
            }  
        }
        if ini_key_exists(inisect, 'spriteIndex') {
            inival = ini_read_string(inisect, 'spriteIndex', 'noone')
            obj = asset_get_index(inival)
            s+='... (*) Sprite ' +inival+ ' ('+ string(obj) +' , '+ sprite_get_name(obj) +')'
            if sprite_exists(obj) {
                parts[partcount-1].sprite_index = obj
            } else {
                parts[partcount-1].sprite_index = -1
                s+=" Doesn't exists! No sprite used for this part. "
            }
        }
        
        // common properties
        if ini_key_exists(inisect, 'xOffset')
            parts[partcount-1].xOffset    = ini_read_real(inisect, 'xOffset', 0)
        if ini_key_exists(inisect, 'yOffset')
            parts[partcount-1].yOffset    = ini_read_real(inisect, 'yOffset', 0)
        if ini_key_exists(inisect, 'parentPart')
            parts[partcount-1].parentPart = ini_read_real(inisect, 'parentPart', 0) - 1
            
        // chassis properties
        if ini_key_exists(inisect, 'maxSpeed') 
            parts[partcount-1].maxSpeed   = ini_read_real(inisect, 'maxSpeed', 0)
        if ini_key_exists(inisect, 'accel')
            parts[partcount-1].accel      = ini_read_real(inisect, 'accel', 0)
        if ini_key_exists(inisect, 'turnSpeed')
            parts[partcount-1].turnSpeed  = ini_read_real(inisect, 'turnSpeed', 0)
        if ini_key_exists(inisect, 'stopFactor')
            parts[partcount-1].stopFactor = ini_read_real(inisect, 'stopFactor', 0)
            
        // cannon properties
        if ini_key_exists(inisect, 'shotName') {
            inival = ini_read_string(inisect, 'shotName', '')
            s += 'Shot name is '+ inival
            parts[partcount-1].shotName = inival
        }            
        if ini_key_exists(inisect, 'sprayFactor')
            parts[partcount-1].sprayFactor   = ini_read_real(inisect, 'sprayFactor', 0)
            
        // head properties
        if ini_key_exists(inisect, 'activeDist')
            parts[partcount-1].activeDist   = ini_read_real(inisect, 'activeDist', 0)
        if ini_key_exists(inisect, 'fireDist')
            parts[partcount-1].fireDist   = ini_read_real(inisect, 'fireDist', 0)
        if ini_key_exists(inisect, 'shotTime')
            parts[partcount-1].shotTime   = ini_read_real(inisect, 'shotTime', 0)
        if ini_key_exists(inisect, 'burstCount')
            parts[partcount-1].burstCount   = ini_read_real(inisect, 'burstCount', 0)
        if ini_key_exists(inisect, 'burstTime')
            parts[partcount-1].burstTime   = ini_read_real(inisect, 'burstTime', 0)
        if ini_key_exists(inisect, 'rotateRange')
            parts[partcount-1].rotateRange = ini_read_real(inisect, 'rotateRange', 0)
            
        if ini_key_exists(inisect, 'soundShot') {
            inival = ini_read_string(inisect, 'soundShot', '')
            obj = asset_get_index(inival)
            s+='... (*) Sound ' +inival+ ' ('+ string(obj) +' , '+ sound_get_name(obj) +')'
            if sound_exists(obj) {
                parts[partcount-1].soundShot = obj
            } else {
                // error during load
                loadedOk = false
                s+=" Doesn't exists!"
            }
        }
                    
        show_debug_message(s)    
        
    } else {
        show_debug_message('Section '+inisect+" doesn't exists! Reading stopped")
        s = ""
        break
    }
} until false

show_debug_message(s)    

if loadedOk 
    show_debug_message("Loaded successfully )))")
else    
    show_debug_message("Errors occured during loading (((")

ini_close()
