/// sc_take_damage(unit, shot)

var _gameobject = argument0,  
    _s = argument1;  // shot

if ( instance_exists(_gameobject) and instance_exists(_s))
with (_gameobject) {

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
