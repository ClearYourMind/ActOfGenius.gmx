/// sc_play_sound(sound)

var _sn = argument[0]  // sound index
var _em = noone // emitter

//  show_debug_message('Sound playing: '+string(_sn))
  
  if audio_exists(_sn) {
    for (var i=0; i<channelNum; i++) 
    if not audio_is_playing(emitterSounds[i]) {
      _em = emitters[i]
      audio_emitter_position(_em, x,y, 0)        // emitter встает на координаты объекта, вызвавшего скрипт
      emitterSounds[i] = audio_play_sound_on(_em, _sn, false, 10)
      break
    }  
  }

  return _em     // возвращаем emitter для того, чтобы им можно было манипулировать в дальнейшем
  
  /***************************************************
    Скрипт выдает выбранный свободный emitter
    Emitter'ы хранятся в глобальном массиве
  
    Чтобы узнать играет ли звук из emitter'а, исп-ся
    массив воспроизводимых звуков
   ***************************************************/
