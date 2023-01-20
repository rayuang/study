// 变量
var num = 18
console.log(num)
num = 20
console.log(num)
/* 
    数据类型：
    Number
    String
    Boolean
    Undefined : 声明未赋值
    Null : 未指向任何对象
    Symbol
*/
num += "abc"
console.log(num)
var username
console.log(username)
username = "wang"
console.log(username)
var isDel = false //0,true为1
console.log(isDel)
// 检测数据类型：两种用法
console.log(typeof (num), typeof username, typeof (isDel))
// 数据类型转换: NaN=>not Number 但属于Number类型 为不合法
/* 
转数值Number(),转换不过来即NaN,Null对象转数值后为0
parseInt(),parseFloat()
 */
var str = "100"
var str_2 = Number(str)
var username_2 = Number(username)//NaN
console.log(str, str_2, typeof str, typeof str_2, username_2)
var myAge = "18abc"
var myAge_2 = parseInt(myAge)
console.log(myAge_2)//18，无法转换的将丢弃，转小数会丢弃小数点后的
var yourAge = 20.7
var yourAge_2 = parseFloat(yourAge)
console.log(yourAge_2)//可转小数，无效丢弃
// 非+运算转数值
var number_1 = "100"
var number_2 = "100"
var number_3 = "100"
console.log(number_1 - 0, number_2 * 1, number_3 / 1)
/* 
转字符串 String() and toString() and 拼串
*/
var a = 100
var b = String(a)//布尔转后为true或false字符串，undefined和Null转后为字符串形式的undefined和Null
var c = true
var d = c.toString()//不可转Null和undefined，若转化则报错
var e = 300
var f = e + ""
console.log(b, d, f)
/* 
转布尔 在js中，只有'' "" 0 null undefined NaN这些事false其他都为true
*/
