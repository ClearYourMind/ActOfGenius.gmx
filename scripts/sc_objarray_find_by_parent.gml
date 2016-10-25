 /// sc_objarray_find_by_parent(arr, parent)

var arr = argument[0]
var par = argument[1]
var arrLen = array_length_1d(arr)

var res;  res[0] = noone
var num = 0;

if !is_array(arr) or !object_exists(par) {
    show_debug_message('sc_objarray_find_by_parent Failed!')
    return res
}
for (var i=0; i<arrLen; i++)
if instance_exists(arr[i]) {
    var obj1 = arr[i].object_index
    if object_is_ancestor(arr[i].object_index, par) {
        res[num] = arr[i]
        num++ 
    }
}
return res
