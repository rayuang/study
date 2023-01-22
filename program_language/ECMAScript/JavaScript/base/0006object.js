/* 
对象数据类型
简单类型：栈  
复杂类型：堆
*/
var obj_1 = {
    username: "wang",
    password: "rui",
    age: 20,
    isDel: false
}
console.log(obj_1, obj_1.username)
var obj_2 = {}
obj_2.username = "abc"
console.log(obj_2.username)

// 创建对象方式2 -> 内置构造函数方法
var obj_3 = new Object()
obj_3.username = "jie"
console.log(obj_3)
// add
obj_3.age = 18
obj_3["hobby"] = "reader"//键必须加引号,否则会当成变量名
// update
obj_3.age = 20
obj_3["hobby"] = "sleep"
// select
console.log(obj_3.age, obj_3)
console.log(obj_3["hobby"])
// del
delete obj_3.age
console.log(obj_3)
delete obj_3["hobby"]
console.log(obj_3)
// 浏览器点对象前面的箭头为重新访问
// 若对象键出现特殊符号，需使用[]操作对象，否则会出现弊端，如 console.log(obj_3.a+b = "")会报错
/* 
对象遍历
*/
var obj_4 = {
    username: "wang",
    age: 18,
    hobby: "reader"
}
for (const key in obj_4) {
    if (Object.hasOwnProperty.call(obj_4, key)) {
        const element = obj_4[key];
        console.log(key, "=", element)

    }
}

var obj_5 = obj_4//复制的是对象的地址，不是对象本身
console.log(obj_4 === obj_5)
// 复制
var obj_6 = {}
for (const key in obj_4) {
    if (Object.hasOwnProperty.call(obj_4, key)) {
        obj_6[key] = obj_4[key];
    }
}
console.log(obj_4, obj_6, obj_4 === obj_6)