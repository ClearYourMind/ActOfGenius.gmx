/// sc_deal_damage()

// of ob_shot

var _s;  // shot
_s = id

with ob_game_object
if collision_circle(_s.x, _s.y, _s.hitSize*0.5, id, false, false) {
    if script_exists(scTakeDamage)
    script_execute(scTakeDamage, _s)
}

