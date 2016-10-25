/// sc_objarray_add(arr, value)
var arr = argument[0]
var obj = argument[1]
var arrLen = array_length_1d(arr)

if !is_array(arr) or !instance_exists(obj) return false

for (var i=0; i<arrLen; i++) {
    if !instance_exists(arr[i]) {
        arr[i] = obj
        return arr
    }
}

// if didn't replaced unexisted object, add to end of arr  (slow place)

arr[arrLen] = obj
return arr
