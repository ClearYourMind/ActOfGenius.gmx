#define sc_unit_ai_1
/// sc_unit_ai_1()
/*
 Скрипт присваивается к aiMainScript, выполняется всегда перед aiScript.
 Определяет для юнита каким должен быть aiScript
*/

// Проверяем досигаема ли еще цель, и жива ли
if instance_exists(target) {
    if (distance_to_object(target) > sightDist)
    target = noone
} 

// Скрипт выдает 0 если он больше не уместен 
var success = 0
if script_exists(aiScript)
    success = script_execute(aiScript) 
 
if success != -1   // not success
    aiScript = scIdle
   


#define sc_unit_ai_findtarget
/// sc_unit_ai_findtarget()

/// searching target

if !instance_exists(target) {
    with (ob_unit) {
        if (teamId != other.teamId)
        if (distance_to_object(other) <= other.sightDist) {
            other.target = id
            break
        }
    }
}

if instance_exists(target) {
//       show_debug_message( 'Unit "'+fullname+'"('+string(id)+') found target "'+target.fullname+'"('+string(target.id)+')'  +
//         ' at distance '+string(distance_to_object(target)) )
    aiScript = scTargetFound
}

return -1 



#define sc_unit_ai_targetfound
/// sc_unit_ai_targetfound()
/// Когда цель найдена  (выбор preferHead)

///  Script for unit that has HEADs and can ATTACK

// Select most suitable head
// select the head with closest fireDist, that can shoot target
// (close firing is in high priority)

if not instance_exists(target) 
    return 0

preferHead = noone

var d = distance_to_point(target.x, target.y)
for (var i=0; i<array_length_1d(head); i++) {   
    if not instance_exists(preferHead)
        preferHead = head[i]
    else {
        if preferHead.fireDist > head[i].fireDist and  // closest fireDist
           head[i].fireDist >= d                       // can shoot target
            preferHead = head[i]
        else {
            //idle this head
            head[i].idea=''
            head[i].tgAngle = 0
            head[i].target = noone
        }                
    }
}
 
if instance_exists(preferHead)
    aiScript = scDestroyTarget      
else
    aiScript = scFollowTarget        
 
return -1



#define sc_unit_ai_follow
/// sc_unit_ai_follow()
// follow enemy unit

if not instance_exists(id) exit
if not instance_exists(target) {
  return 0
}

var d = distance_to_point(target.x, target.y)

if instance_exists(preferChassis) {
  if instance_exists(preferHead) and d < preferHead.fireDist {
    preferChassis.idea = 'stop'
    aiScript = scDestroyTarget
  
  } else {
    preferChassis.tgX = target.x
    preferChassis.tgY = target.y
    preferChassis.idea = 'goto'
  }
//  return -1 // success
//} else
//  return 0  // fail (reason number)
}
  
script_execute(scTargetFound)

return -1 // success


#define sc_unit_ai_destroytarget
/// sc_unit_ai_destroytarget()
// Point at enemy unit and open fire


if not instance_exists(id) exit

if instance_exists(preferHead) {
    if instance_exists(target) {
        preferHead.target = target
        if preferHead.okAngle {
            preferHead.idea = 'shot'
        }   
    } else {
        preferHead.tgAngle = 0  
        preferHead.target = noone
        return 0
    }  
  
    if instance_exists(target) {
        var d = distance_to_point(target.x, target.y)
        if d > preferHead.fireDist {
            // change preferred head?
            aiScript = scFollowTarget
        }
    }
}
             
script_execute(scTargetFound)

return -1    // success



#define sc_unit_idle
/// sc_unit_idle(next_script)

/* 
    Brings unit into Default state
    Сделан специально для сброса любого действия (обнуления)
*/ 

for (var i=0; i<array_length_1d(head); i++) 
if instance_exists(head[i]) {
  head[i].idea=''
  head[i].tgAngle = 0
  head[i].target = noone
}

for (var i=0; i<array_length_1d(chassis); i++)
if  instance_exists(chassis[i]) {
  chassis[i].idea = 'stop'
}


if not instance_exists(target)
  aiScript = scFindTarget
//  ^^ it should do scMainScript ???
 
// run next script
if argument_count>0
if script_exists(argument[0]) {
  aiScript = argument[0]
}

return -1