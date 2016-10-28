/// sc_game_object_take_damage(shot)


var _s = argument0;  // shot

if ( instance_exists(id) and instance_exists(_s))
if object_is_ancestor(id, ob_game_object) {
  
    objHealth -= _s.damage
      
}
   
