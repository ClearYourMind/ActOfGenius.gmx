// Поиск потомков объекта в списке

var _list = argument[0],   
    _objType = argument[1];  // object type or instance
    if argument_count>2
      var _exactObj = argument[2]  // искать конкретный объект
    else
      var _exactObj = false
    
var res = 0,
    resCount = 0
    
if ds_exists(_list, ds_type_list) {

  var cn = ds_list_size(_list)

  if not _exactObj {        // искать похожие объекты
    for (var i=0; i<cn; i++) {  
      var _listObj = ds_list_find_value(_list, i)
  //    if object_exists(_listObj)
      if (object_is_ancestor(_listObj.object_index, _objType)) or (_listObj.object_index == _objType) {
        res[resCount] = _listObj.id
        resCount++
      }
    }
    return res
  } else {                 // искать конкретный объект
    var res=-1
    if instance_exists(_objType)
    for (i=0; i<cn; i++) {  
      var _listObj = ds_list_find_value(_list, i)
      if instance_exists(_listObj)
      if _listObj.id == _objType.id {
        res = i
        break
      }
    }  
    return res
  }  
}
