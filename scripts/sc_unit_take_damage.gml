/// sc_unit_take_damage(shot)


var _s = argument0;  // shot

if ( instance_exists(id) and instance_exists(_s))
if object_is_ancestor(id.object_index, ob_unit)
if _s.friendlyHurt or (teamId != _s.teamId) {

    var _dmg = _s.damage                                   
    var _absorb = 0
    if shieldValue>0 {
//        _absorb = _s.damage / shieldType
        shieldValue -= _dmg
        _dmg = 0
    }  
//    _dmg *= resistCoeff[broneType, _s.damageType] / broneValue
  
    objHealth -= _dmg
  
//    showHealth = true
//    lastDamageFrom = _s.teamId
//    alarm[1] = 50     // время до исчезновения полоски жизней
//    alarm[3] = 200    // время до начала регенерации щитов
    
}
   
