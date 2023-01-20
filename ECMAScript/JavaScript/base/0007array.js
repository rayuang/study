/* 
数组
*/
var ageArr = [12,15,17,18]
ageArr.forEach(element => {
    console.log(element)
});
//只传一个数为创建数组的长度，多个数直接创建数组
var arr_1 = new Array(12,15,16,13)
console.log(arr_1)
var arr_2 = new Array(10)
console.log(arr_2)
// 读lenght
console.log(arr_1.length)
// 写length -> 常用于清空数组
arr_1.length = 5
console.log(arr_1)
// read
console.log(arr_1[0])
// update
arr_1[0] = 25
console.log(arr_1)
arr_1[arr_1.length - 1] = 17
console.log(arr_1)
for(var i = 0;i < arr_1.length;i++){
    console.log(arr_1[i])
}